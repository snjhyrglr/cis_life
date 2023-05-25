class ProcessCoveragesController < ApplicationController
  before_action :set_process_coverage, only: %i[ show edit update destroy approve_batch deny_batch pending_batch ]

  # GET /process_coverages or /process_coverages.json
  def index
    @process_coverages = ProcessCoverage.all
  end

  # GET /process_coverages/1 or /process_coverages/1.json
  def show

    # if params[:search_filter].nil?
    #   @batches = @process_coverage.group_remit.batches.includes(:coop_member, :member)
    # else
    #   @batches = @process_coverage.group_remit.batches.joins(:coop_member, :member).where("coop_members.last_name LIKE ? OR coop_members.first_name LIKE ? OR coop_members.middle_name LIKE ? OR batches.status LIKE ?", "%#{params[:search_filter]}%", "%#{params[:search_filter]}%", "%#{params[:search_filter]}%", "%#{params[:search_filter]}%")
    # end
    @batches = @process_coverage.group_remit.batches.includes(:coop_member, :member)
    if params[:search].present?
      @batches = case params[:search]
        when "regular" then @batches.where(age: 18..65)
        when "overage" then @batches.where(age: 65..)
        else
          @batches
      end
    end
    @pagy_batch, @filtered_batches  = pagy(@batches, items: 25, page_param: :batch)

    @process_cov = ProcessCoverage.includes(group_remit: { batches: [:batch_remarks, coop_member: :member ] }).find(params[:id])

    @process_remarks = @process_coverage.process_remarks

    @pagy_rem, @filtered_remarks = pagy(@process_remarks, items: 3, page_param: :remark)

    @life_cov = ProcessCoverage.includes(group_remit: { moa: { proposal:{ proposal_insureds: :proposal_insured_benefits }}}).find_by(id: @process_coverage.id).group_remit.moa.proposal.proposal_insureds.joins(:proposal_insured_benefits).where(proposal_insureds: {insured_type: 1}, proposal_insured_benefits: {benefit: 1}).pluck('proposal_insured_benefits.cov_amount').first

    puts "#{@life_cov} ********************************"

  end

  def approve
    @process_coverage = ProcessCoverage.find_by(id: params[:process_coverage_id])

    respond_to do |format|
      if @process_coverage.update_attribute(:status, "Approved")
        format.html { redirect_to process_coverage_path(@process_coverage), notice: "Process Coverage Approved!" }
      end
    end
  end
  
  def deny
    @process_coverage = ProcessCoverage.find_by(id: params[:process_coverage_id])
    
    respond_to do |format|
      if @process_coverage.update_attribute(:status, "Denied")
        format.html { redirect_to process_coverage_path(@process_coverage), alert: "Process Coverage Denied!" }
      end
    end
  end

  def approve_batch
    # raise 'errors'
    @batch = Batch.find(params[:batch])

    respond_to do |format|
      if @batch.update_attribute(:insurance_status, "Approved")
        @process_coverage.increment!(:approved_count)
        format.html { redirect_to process_coverage_path(@process_coverage), notice: "Batch Approved!" }
      end
    end
  end

  def pending_batch
    # raise 'errors'
    @batch = Batch.find(params[:batch])

    respond_to do |format|
      if @batch.update_attribute(:insurance_status, "Pending")
        format.html { redirect_to process_coverage_path(@process_coverage), notice: "Pending batch updated!" }
      end
    end
  end

  def deny_batch
    @batch = Batch.find(params[:batch])

    respond_to do |format|
      if @batch.update_attribute(:insurance_status, "Denied")
        @process_coverage.increment!(:denied_count)
        format.html { redirect_to process_coverage_path(@process_coverage), alert: "Batch Denied!" }
      end
    end
  end

  def modal_remarks
    @batch = Batch.find(params[:batch])
  end

  # GET /process_coverages/new
  def new
    @process_coverage = ProcessCoverage.new
  end

  # GET /process_coverages/1/edit
  def edit
  end

  # POST /process_coverages or /process_coverages.json
  def create
    @process_coverage = ProcessCoverage.new(process_coverage_params)

    respond_to do |format|
      if @process_coverage.save
        format.html { redirect_to process_coverage_url(@process_coverage), notice: "Process coverage was successfully created." }
        format.json { render :show, status: :created, location: @process_coverage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @process_coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /process_coverages/1 or /process_coverages/1.json
  def update
    respond_to do |format|
      if @process_coverage.update(process_coverage_params)
        format.html { redirect_to process_coverage_url(@process_coverage), notice: "Process coverage was successfully updated." }
        format.json { render :show, status: :ok, location: @process_coverage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @process_coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /process_coverages/1 or /process_coverages/1.json
  def destroy
    @process_coverage.destroy

    respond_to do |format|
      format.html { redirect_to process_coverages_url, notice: "Process coverage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_process_coverage
      @process_coverage = ProcessCoverage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def process_coverage_params
      params.require(:process_coverage).permit(:group_remit_id, :plan_id, :agent_id, :effectivity, :expiry, :status, 
      process_remarks_attributes: [:reference_id, :reference_type, :remark, :user_id, :user_type])
    end
end
