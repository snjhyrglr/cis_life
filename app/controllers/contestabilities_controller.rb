class ContestabilitiesController < ApplicationController
  before_action :set_contestability, only: %i[ show edit update destroy ]

  # GET /contestabilities or /contestabilities.json
  def index
    @contestabilities = Contestability.all
  end

  # GET /contestabilities/1 or /contestabilities/1.json
  def show
  end

  # GET /contestabilities/new
  def new
    @contestability = Contestability.new
  end

  # GET /contestabilities/1/edit
  def edit
  end

  # POST /contestabilities or /contestabilities.json
  def create
    @contestability = Contestability.new(contestability_params)

    respond_to do |format|
      if @contestability.save
        format.html { redirect_to contestability_url(@contestability), notice: "Contestability was successfully created." }
        format.json { render :show, status: :created, location: @contestability }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contestability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contestabilities/1 or /contestabilities/1.json
  def update
    respond_to do |format|
      if @contestability.update(contestability_params)
        format.html { redirect_to contestability_url(@contestability), notice: "Contestability was successfully updated." }
        format.json { render :show, status: :ok, location: @contestability }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contestability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contestabilities/1 or /contestabilities/1.json
  def destroy
    @contestability.destroy

    respond_to do |format|
      format.html { redirect_to contestabilities_url, notice: "Contestability was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contestability
      @contestability = Contestability.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contestability_params
      params.require(:contestability).permit(:min_age, :max_age, :member_type, :period, :period_type)
    end
end
