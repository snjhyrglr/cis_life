class RateTablesController < ApplicationController
  before_action :set_rate_table, only: %i[ show edit update destroy ]

  # GET /rate_tables or /rate_tables.json
  def index
    @rate_tables = RateTable.all
  end

  # GET /rate_tables/1 or /rate_tables/1.json
  def show
  end

  # GET /rate_tables/new
  def new
    @rate_table = RateTable.new
  end

  # GET /rate_tables/1/edit
  def edit
  end

  # POST /rate_tables or /rate_tables.json
  def create
    @rate_table = RateTable.new(rate_table_params)

    respond_to do |format|
      if @rate_table.save
        format.html { redirect_to rate_table_url(@rate_table), notice: "Rate table was successfully created." }
        format.json { render :show, status: :created, location: @rate_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rate_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rate_tables/1 or /rate_tables/1.json
  def update
    respond_to do |format|
      if @rate_table.update(rate_table_params)
        format.html { redirect_to rate_table_url(@rate_table), notice: "Rate table was successfully updated." }
        format.json { render :show, status: :ok, location: @rate_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rate_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rate_tables/1 or /rate_tables/1.json
  def destroy
    @rate_table.destroy

    respond_to do |format|
      format.html { redirect_to rate_tables_url, notice: "Rate table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate_table
      @rate_table = RateTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rate_table_params
      params.require(:rate_table).permit(:proposal_id, :gyrt_rate_id, :count, :qx)
    end
end
