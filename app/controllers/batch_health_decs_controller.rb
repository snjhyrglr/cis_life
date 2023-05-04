class BatchHealthDecsController < ApplicationController
  before_action :set_batch_health_dec, only: %i[ show edit update destroy ]

  # GET /batch_health_decs or /batch_health_decs.json
  def index
    @batch_health_decs = BatchHealthDec.all
  end

  # GET /batch_health_decs/1 or /batch_health_decs/1.json
  def show
    @health_dec = @batch_health_dec.health_dec_question
  end

  # GET /batch_health_decs/new
  def new
    @batch_health_dec = BatchHealthDec.new
    @health_dec = HealthDecQuestion.find_by(id: 1)
  end

  # GET /batch_health_decs/1/edit
  def edit
  end

  # POST /batch_health_decs or /batch_health_decs.json
  def create
    raise 'errors'
    @batch_health_dec = BatchHealthDec.new(batch_health_dec_params)
    @health_dec = HealthDecQuestion.find_by(id: 1)

    respond_to do |format|
      if @batch_health_dec.save
        format.html { redirect_to batch_health_dec_url(@batch_health_dec), notice: "Batch health dec was successfully created." }
        format.json { render :show, status: :created, location: @batch_health_dec }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch_health_dec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_health_decs/1 or /batch_health_decs/1.json
  def update
    respond_to do |format|
      if @batch_health_dec.update(batch_health_dec_params)
        format.html { redirect_to batch_health_dec_url(@batch_health_dec), notice: "Batch health dec was successfully updated." }
        format.json { render :show, status: :ok, location: @batch_health_dec }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_health_dec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_health_decs/1 or /batch_health_decs/1.json
  def destroy
    @batch_health_dec.destroy

    respond_to do |format|
      format.html { redirect_to batch_health_decs_url, notice: "Batch health dec was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_health_dec
      @batch_health_dec = BatchHealthDec.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_health_dec_params
      params.require(:batch_health_dec).permit(:batch_id, :health_dec_question_id, :sub_rate, :sub_prem, :sub_coverage, :status, :ans_q1, :ans_q2, :ans_q3_desc, :ans_q3, :ans_q4_desc, :ans_q4, :ans_q5_a_desc, :ans_q5_a, :ans_q5_b_desc, :ans_q5_b, health_dec_docs: [])
    end
end
