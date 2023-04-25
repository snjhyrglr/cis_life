class ProposalOfficersController < ApplicationController
  before_action :set_proposal_officer, only: %i[ show edit update destroy ]

  # GET /proposal_officers or /proposal_officers.json
  def index
    @proposal_officers = ProposalOfficer.all
  end

  # GET /proposal_officers/1 or /proposal_officers/1.json
  def show
  end

  # GET /proposal_officers/new
  def new
    @proposal_officer = ProposalOfficer.new
  end

  # GET /proposal_officers/1/edit
  def edit
  end

  # POST /proposal_officers or /proposal_officers.json
  def create
    @proposal_officer = ProposalOfficer.new(proposal_officer_params)

    respond_to do |format|
      if @proposal_officer.save
        format.html { redirect_to proposal_officer_url(@proposal_officer), notice: "Proposal officer was successfully created." }
        format.json { render :show, status: :created, location: @proposal_officer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proposal_officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposal_officers/1 or /proposal_officers/1.json
  def update
    respond_to do |format|
      if @proposal_officer.update(proposal_officer_params)
        format.html { redirect_to proposal_officer_url(@proposal_officer), notice: "Proposal officer was successfully updated." }
        format.json { render :show, status: :ok, location: @proposal_officer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposal_officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposal_officers/1 or /proposal_officers/1.json
  def destroy
    @proposal_officer.destroy

    respond_to do |format|
      format.html { redirect_to proposal_officers_url, notice: "Proposal officer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_officer
      @proposal_officer = ProposalOfficer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proposal_officer_params
      params.require(:proposal_officer).permit(:proposal_id, :officer_id)
    end
end
