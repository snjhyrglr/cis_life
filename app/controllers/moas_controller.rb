class MoasController < ApplicationController
  before_action :set_moa, only: %i[ show edit update destroy ]

  # GET /moas or /moas.json
  def index
    @moas = Moa.all
  end

  # GET /moas/1 or /moas/1.json
  def show
    @proposal = @moa.proposal
  end

  # GET /moas/new
  def new
    @moa = Moa.new
  end

  # GET /moas/1/edit
  def edit
  end

  # POST /moas or /moas.json
  def create
    @moa = Moa.new(moa_params)

    respond_to do |format|
      if @moa.save
        format.html { redirect_to moa_url(@moa), notice: "Moa was successfully created." }
        format.json { render :show, status: :created, location: @moa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moas/1 or /moas/1.json
  def update
    respond_to do |format|
      if @moa.update(moa_params)
        format.html { redirect_to moa_url(@moa), notice: "Moa was successfully updated." }
        format.json { render :show, status: :ok, location: @moa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moas/1 or /moas/1.json
  def destroy
    @moa.destroy

    respond_to do |format|
      format.html { redirect_to moas_url, notice: "Moa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moa
      @moa = Moa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def moa_params
      params.require(:moa).permit(:proposal_id, :moa_no, :notarized_date, :moa_signed_date)
    end
end
