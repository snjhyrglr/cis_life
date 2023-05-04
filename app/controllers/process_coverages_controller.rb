class ProcessCoveragesController < ApplicationController
  before_action :set_process_coverage, only: %i[ show edit update destroy approve_batch deny_batch ]

  # GET /process_coverages or /process_coverages.json
  def index
    @process_coverages = ProcessCoverage.all
  end

  # GET /process_coverages/1 or /process_coverages/1.json
  def show
    if params[:search_filter].nil?
      @batches = @process_coverage.group_remit.batches.includes(:coop_member)
    else
      @batches = @process_coverage.group_remit.batches.joins(:coop_member).where("coop_members.last_name LIKE ? OR coop_members.first_name LIKE ? OR coop_members.middle_name LIKE ? OR batches.status LIKE ?", "%#{params[:search_filter]}%", "%#{params[:search_filter]}%", "%#{params[:search_filter]}%", "%#{params[:search_filter]}%")
    end
    @pagy, @filtered_batches  = pagy(@batches)
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

  def deny_batch
    @batch = Batch.find(params[:batch])

    respond_to do |format|
      if @batch.update_attribute(:insurance_status, "Denied")
        format.html { redirect_to process_coverage_path(@process_coverage), alert: "Batch Denied!" }
      end
    end
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
