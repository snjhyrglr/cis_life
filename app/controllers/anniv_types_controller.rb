class AnnivTypesController < ApplicationController
  before_action :set_anniv_type, only: %i[ show edit update destroy ]

  # GET /anniv_types or /anniv_types.json
  def index
    @anniv_types = AnnivType.all
  end

  # GET /anniv_types/1 or /anniv_types/1.json
  def show
  end

  # GET /anniv_types/new
  def new
    @anniv_type = AnnivType.new
  end

  # GET /anniv_types/1/edit
  def edit
  end

  # POST /anniv_types or /anniv_types.json
  def create
    @anniv_type = AnnivType.new(anniv_type_params)

    respond_to do |format|
      if @anniv_type.save
        format.html { redirect_to anniv_type_url(@anniv_type), notice: "Anniv type was successfully created." }
        format.json { render :show, status: :created, location: @anniv_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anniv_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anniv_types/1 or /anniv_types/1.json
  def update
    respond_to do |format|
      if @anniv_type.update(anniv_type_params)
        format.html { redirect_to anniv_type_url(@anniv_type), notice: "Anniv type was successfully updated." }
        format.json { render :show, status: :ok, location: @anniv_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anniv_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anniv_types/1 or /anniv_types/1.json
  def destroy
    @anniv_type.destroy

    respond_to do |format|
      format.html { redirect_to anniv_types_url, notice: "Anniv type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anniv_type
      @anniv_type = AnnivType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anniv_type_params
      params.require(:anniv_type).permit(:name)
    end
end
