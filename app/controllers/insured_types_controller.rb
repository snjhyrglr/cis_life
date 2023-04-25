class InsuredTypesController < ApplicationController
  before_action :set_insured_type, only: %i[ show edit update destroy ]

  # GET /insured_types or /insured_types.json
  def index
    @insured_types = InsuredType.all
  end

  # GET /insured_types/1 or /insured_types/1.json
  def show
  end

  # GET /insured_types/new
  def new
    @insured_type = InsuredType.new
  end

  # GET /insured_types/1/edit
  def edit
  end

  # POST /insured_types or /insured_types.json
  def create
    @insured_type = InsuredType.new(insured_type_params)

    respond_to do |format|
      if @insured_type.save
        format.html { redirect_to insured_type_url(@insured_type), notice: "Insured type was successfully created." }
        format.json { render :show, status: :created, location: @insured_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insured_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insured_types/1 or /insured_types/1.json
  def update
    respond_to do |format|
      if @insured_type.update(insured_type_params)
        format.html { redirect_to insured_type_url(@insured_type), notice: "Insured type was successfully updated." }
        format.json { render :show, status: :ok, location: @insured_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insured_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insured_types/1 or /insured_types/1.json
  def destroy
    @insured_type.destroy

    respond_to do |format|
      format.html { redirect_to insured_types_url, notice: "Insured type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insured_type
      @insured_type = InsuredType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insured_type_params
      params.require(:insured_type).permit(:name, :description)
    end
end
