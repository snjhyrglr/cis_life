class BatchRemarksController < ApplicationController
  before_action :set_batch_remark, only: %i[ show edit update destroy ]

  # GET /batch_remarks or /batch_remarks.json
  def index
    @batch_remarks = BatchRemark.all
  end

  # GET /batch_remarks/1 or /batch_remarks/1.json
  def show
  end

  # GET /batch_remarks/new
  def new
    @title = case params[:batch_status]
      when "Pending" then "Pending Batch"
      when "Deny" then "Deny Batch"
    end

    @batch_status = params[:batch_status]
    @process_coverage = params[:pro_cov]

    @batch = Batch.find(params[:ref])
    @batch_remark = @batch.batch_remarks.build
    # @batch_remark = BatchRemark.new
  end

  # GET /batch_remarks/1/edit
  def edit
  end

  # POST /batch_remarks or /batch_remarks.json
  def create
    # raise 'errors'
    @batch_remark = BatchRemark.new(batch_remark_params)
    @batch_remark.user_type = current_user.userable_type
    @batch_remark.user_id = current_user.userable_id
    
    @batch = Batch.find_by(id: params[:batch_remark][:batch_id])
    @process_coverage = ProcessCoverage.find_by(id: params[:batch_remark][:process_coverage])

    respond_to do |format|
      if @batch_remark.save
        
        if params[:batch_remark][:batch_status] == "Pending"
          format.html { redirect_to pending_batch_process_coverage_path(id: @process_coverage.id, batch: @batch)}
        elsif params[:batch_remark][:batch_status] == "Deny"
          format.html { redirect_to deny_batch_process_coverage_path(id: @process_coverage.id, batch: @batch)}
        else
          format.html { redirect_to batch_remark_url(@batch_remark), notice: "Batch remark was successfully created." }
          format.json { render :show, status: :created, location: @batch_remark }
        end

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch_remark.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_remarks/1 or /batch_remarks/1.json
  def update
    respond_to do |format|
      if @batch_remark.update(batch_remark_params)
        format.html { redirect_to batch_remark_url(@batch_remark), notice: "Batch remark was successfully updated." }
        format.json { render :show, status: :ok, location: @batch_remark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_remark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_remarks/1 or /batch_remarks/1.json
  def destroy
    @batch_remark.destroy

    respond_to do |format|
      format.html { redirect_to batch_remarks_url, notice: "Batch remark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_remark
      @batch_remark = BatchRemark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_remark_params
      params.require(:batch_remark).permit(:batch_id, :text, :user_id)
    end
end
