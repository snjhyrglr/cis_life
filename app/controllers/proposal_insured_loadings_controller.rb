class ProposalInsuredLoadingsController < ApplicationController
  before_action :set_proposal_insured_loading, only: %i[ show edit update destroy ]

  # GET /proposal_insured_loadings or /proposal_insured_loadings.json
  def index
    @proposal_insured_loadings = ProposalInsuredLoading.all
  end

  # GET /proposal_insured_loadings/1 or /proposal_insured_loadings/1.json
  def show
  end

  # GET /proposal_insured_loadings/new
  def new
    @proposal_insured_loading = ProposalInsuredLoading.new
  end

  # GET /proposal_insured_loadings/1/edit
  def edit
  end

  # POST /proposal_insured_loadings or /proposal_insured_loadings.json
  def create
    @proposal_insured_loading = ProposalInsuredLoading.new(proposal_insured_loading_params)

    respond_to do |format|
      if @proposal_insured_loading.save
        format.html { redirect_to proposal_insured_loading_url(@proposal_insured_loading), notice: "Proposal insured loading was successfully created." }
        format.json { render :show, status: :created, location: @proposal_insured_loading }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proposal_insured_loading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposal_insured_loadings/1 or /proposal_insured_loadings/1.json
  def update
    respond_to do |format|
      if @proposal_insured_loading.update(proposal_insured_loading_params)
        format.html { redirect_to proposal_insured_loading_url(@proposal_insured_loading), notice: "Proposal insured loading was successfully updated." }
        format.json { render :show, status: :ok, location: @proposal_insured_loading }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposal_insured_loading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposal_insured_loadings/1 or /proposal_insured_loadings/1.json
  def destroy
    @proposal_insured_loading.destroy

    respond_to do |format|
      format.html { redirect_to proposal_insured_loadings_url, notice: "Proposal insured loading was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_insured_loading
      @proposal_insured_loading = ProposalInsuredLoading.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proposal_insured_loading_params
      params.require(:proposal_insured_loading).permit(:proposal_insured_id, :gyrt_loading_id, :name, :rate)
    end
end
