class ProposalsController < ApplicationController
  before_action :set_proposal, only: %i[ show edit update destroy ]

  def index
    @proposals = Proposal.all
  end

  def show
  end

  def new
    @proposal = Proposal.new
    @proposal.build_anniv_type
    # @proposal.officers.build
  end

  def edit
  end

  def create
    # raise 'errors'
    @proposal = Proposal.new(proposal_params)

    respond_to do |format|
      if @proposal.save
        @proposal.convert_sf
        if params[:proposal][:plan_id] == 1 #GYRT
          @proposal.get_gyrt_rate_table(params[:proposal][:file])
          @proposal.get_ages_for_computation_and_save_member(params[:proposal][:file])
          @proposal.compute_total_prem
        end

        format.html { redirect_to proposal_url(@proposal), notice: "Proposal was successfully created." }
        format.json { render :show, status: :created, location: @proposal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to proposal_url(@proposal), notice: "Proposal was successfully updated." }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @proposal.destroy

    respond_to do |format|
      format.html { redirect_to proposals_url, notice: "Proposal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_proposal
      @proposal = Proposal.find(params[:id])
    end

    def proposal_params
      params.require(:proposal).permit(:plan_id, :cooperative_id, :proposal_no, :new_min_age, :new_max_age, :old_min_age, :old_max_age, :ave_age, :member_count, :total_premium, :coop_sf, :agent_sf, :actuarial_approval, :agent_approval, :nel_amount, :nml_amount, :file,
      officers_attributes: [ :last_name, :first_name, :middle_name, :suffx, :birth_day, :designation, :active ],
      proposal_anniv_attributes: [ :proposal_id, :anniv_type_id, :mon, :day, :_destroy ],
      proposal_insureds_attributes: [ :proposal_id, :insured_type_id,
       proposal_insured_benefits_attributes: [ :benefit_id, :cov_amount, :premium, :_destroy ]
      ]
    )
    end
end
