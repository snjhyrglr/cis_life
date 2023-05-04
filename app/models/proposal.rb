class Proposal < ApplicationRecord
  attr_accessor :file

  belongs_to :plan
  belongs_to :cooperative
  
  has_many :proposal_officers
  has_many :officers, through: :proposal_officers
  accepts_nested_attributes_for :officers, reject_if: :all_blank, allow_destroy: true

  has_many :proposal_insureds
  has_many :insured_types, through: :proposal_insureds
  accepts_nested_attributes_for :proposal_insureds, reject_if: :all_blank, allow_destroy: true

  has_one :proposal_anniv
  has_one :anniv_type, through: :proposal_anniv
  accepts_nested_attributes_for :proposal_anniv, reject_if: :all_blank, allow_destroy: true

  has_many :proposal_contestables
  has_many :contestabilities, through: :proposal_contestables

  has_many :proposal_insured_benefits

  after_save :create_default_contestabilities

  FIRST_NAME = Array.new(5) { FFaker::NamePH.unique.first_name }
  

  def convert_sf
    self.update(
      coop_sf: self.coop_sf / 100,
      agent_sf: self.agent_sf / 100
    )
  end

  def get_gyrt_rate_table(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    (2..spreadsheet.last_row).each_with_index do |row, index|
      age = (((Date.today + 6.months) - spreadsheet.cell(row, "D") / 365).to_f).round

      rate_id = GyrtRate.find_by(age: age, benefit_id: 1) # LIFE BENEFIT
      rate_table = RateTable.find_or_initialize_by(proposal_id: self.id, gyrt_rate_id: rate_id).increment(:count)
      rate_table.qx = rate_table.count * (GyrtRate.find_by(id: rate_id).rate * 100)
      rate_table.save!
    end
  end

  def get_ages_for_computation_and_save_member(file)
    final_age = 0
    count = 0

    spreadsheet = Roo::Spreadsheet.open(file)
    (2..spreadsheet.last_row).each_with_index do |row, index|
      age = (((Date.today + 6.months) - spreadsheet.cell(row, "D") / 365).to_f).round
      final_age += age

      coop_member = CoopMember.find_or_initialize_by(cooperative_id: self.cooperative_id,
        last_name: spreadsheet.cell(row, "A"),
        first_name: spreadsheet.cell(row, "B"),
        middle_name: spreadsheet.cell(row, "C"),
        suffix: spreadsheet.cell(row, "D"),
        birthdate: spreadsheet.cell(row, "E"))
      coop_member.coop_branch_id = 1
      coop_member.mobile_number = ""
      coop_member.email = "#{coop_member.last_name}.#{coop_member.first_name[0]}#{rand(1..20)}@test.com"
      count += 1 if coop_member.save!

    end

    average_age = final_age / (count + 1)
    self.ave_age = average_age
    self.members_count = count

    self.proposal_insureds.each do |pi|
      pi.proposal_insured_benefits.each do |pib|
        pib.set_premium(pib.benefit_id)
      end
    end

  end

  def default_gyrt_loading(proposal)
    self.proposal_insureds.each do |pi|
      loading = GyrtLoading.all
      loading.each do |g_load|
        pil = ProposalInsuredLoading.find_or_initialize_by(proposal_insured: pi, gyrt_loading: g_load)
        pil.rate = g_load.rate
        pil.name = g_load.name
        pil.save!
      end
    end
  end

  def compute_total_prem(to_update=nil)
    if to_update.nil?
      default_gyrt_loading(self)
    end

    self.proposal_insureds.each do |pi|
      def_loading = pi.proposal_insured_loadings.sum(:rate)
      loading = (1 - (self.coop_sf + self.agent_sf + def_loading))
      final_premium = pi.proposal_insured_benefits.pluck(:premium).sum / loading

      pi.update(
        total_premium: final_premium.ceil(-1)
      )
    end
  end

  private 

  def create_default_contestabilities
    contest = Contestability.all
    contest.each do |pc|
      self.contestabilities.create!
    end
  end
  
end
