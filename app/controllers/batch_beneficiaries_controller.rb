class BatchBeneficiariesController < ApplicationController
  before_action :set_batch_beneficiary, only: %i[ show edit update destroy ]

  # GET /batch_beneficiaries or /batch_beneficiaries.json
  def index
    @batch_beneficiaries = BatchBeneficiary.all
  end

  # GET /batch_beneficiaries/1 or /batch_beneficiaries/1.json
  def show
  end

  # GET /batch_beneficiaries/new
  def new
    @batch_beneficiary = BatchBeneficiary.new
  end

  # GET /batch_beneficiaries/1/edit
  def edit
  end

  # POST /batch_beneficiaries or /batch_beneficiaries.json
  def create
    @batch_beneficiary = BatchBeneficiary.new(batch_beneficiary_params)

    respond_to do |format|
      if @batch_beneficiary.save

        @batch_beneficiary.compute_age

        format.html { redirect_to batch_beneficiary_url(@batch_beneficiary), notice: "Batch beneficiary was successfully created." }
        format.json { render :show, status: :created, location: @batch_beneficiary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch_beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_beneficiaries/1 or /batch_beneficiaries/1.json
  def update
    respond_to do |format|
      if @batch_beneficiary.update(batch_beneficiary_params)
        @batch_beneficiary.compute_age
        format.html { redirect_to batch_beneficiary_url(@batch_beneficiary), notice: "Batch beneficiary was successfully updated." }
        format.json { render :show, status: :ok, location: @batch_beneficiary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_beneficiaries/1 or /batch_beneficiaries/1.json
  def destroy
    @batch_beneficiary.destroy

    respond_to do |format|
      format.html { redirect_to batch_beneficiaries_url, notice: "Batch beneficiary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_beneficiary
      @batch_beneficiary = BatchBeneficiary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_beneficiary_params
      params.require(:batch_beneficiary).permit(:batch_id, :member_dependent_id)
    end
end
