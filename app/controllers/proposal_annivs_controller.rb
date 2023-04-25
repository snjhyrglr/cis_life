class ProposalAnnivsController < ApplicationController
  before_action :set_proposal_anniv, only: %i[ show edit update destroy ]

  # GET /proposal_annivs or /proposal_annivs.json
  def index
    @proposal_annivs = ProposalAnniv.all
  end

  # GET /proposal_annivs/1 or /proposal_annivs/1.json
  def show
  end

  # GET /proposal_annivs/new
  def new
    @proposal_anniv = ProposalAnniv.new
  end

  # GET /proposal_annivs/1/edit
  def edit
  end

  # POST /proposal_annivs or /proposal_annivs.json
  def create
    @proposal_anniv = ProposalAnniv.new(proposal_anniv_params)

    respond_to do |format|
      if @proposal_anniv.save
        format.html { redirect_to proposal_anniv_url(@proposal_anniv), notice: "Proposal anniv was successfully created." }
        format.json { render :show, status: :created, location: @proposal_anniv }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proposal_anniv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposal_annivs/1 or /proposal_annivs/1.json
  def update
    respond_to do |format|
      if @proposal_anniv.update(proposal_anniv_params)
        format.html { redirect_to proposal_anniv_url(@proposal_anniv), notice: "Proposal anniv was successfully updated." }
        format.json { render :show, status: :ok, location: @proposal_anniv }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proposal_anniv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposal_annivs/1 or /proposal_annivs/1.json
  def destroy
    @proposal_anniv.destroy

    respond_to do |format|
      format.html { redirect_to proposal_annivs_url, notice: "Proposal anniv was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_anniv
      @proposal_anniv = ProposalAnniv.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proposal_anniv_params
      params.require(:proposal_anniv).permit(:proposal_id, :anniv_type_id, :mon, :day)
    end
end
