class ProposalInsuredBenefitsController < ApplicationController
  before_action :set_proposal_insured_benefit, only: %i[ show edit update destroy ]

  # GET /product_lines or /product_lines.json
  def index
    @proposal_insured_benefits = ProposalInsuredBenefit.all
  end

  # GET /product_lines/1 or /product_lines/1.json
  def show
  end

  # GET /product_lines/new
  def new
    @proposal_insured_benefit = ProposalInsuredBenefit.new
  end

  # GET /product_lines/1/edit
  def edit
  end

  # POST /product_lines or /product_lines.json
  def create
    @proposal_insured_benefit = ProposalInsuredBenefit.new(proposal_insured_benefit_params)

    respond_to do |format|
      if @proposal_insured_benefit.save
        format.html { redirect_to proposal_insured_benefit_url(@proposal_insured_benefit), notice: "Product line was successfully created." }
        format.json { render :show, status: :created, location: @proposal_insured_benefit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proposal_insured_benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_lines/1 or /product_lines/1.json
  def update
    respond_to do |format|
      if @proposal_insured_benefit.update(proposal_insured_benefit_params)
        format.html { redirect_to proposal_insured_benefit_url(@proposal_insured_benefit), notice: "Product line was successfully updated." }
        format.json { render :show, status: :ok, location: @proposal_insured_benefit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposal_insured_benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_lines/1 or /product_lines/1.json
  def destroy
    @proposal_insured_benefit.destroy

    respond_to do |format|
      format.html { redirect_to product_lines_url, notice: "Product line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_insured_benefit
      @proposal_insured_benefit = ProposalInsuredBenefit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proposal_insured_benefit_params
      params.require(:proposal_insured_benefit).permit(:proposal_insured_id, :benefit_id, :cov_amount, :premium)
    end
end
