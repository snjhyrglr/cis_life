class HealthDecQuestionsController < ApplicationController
  before_action :set_health_dec_question, only: %i[ show edit update destroy ]

  # GET /health_dec_questions or /health_dec_questions.json
  def index
    @health_dec_questions = HealthDecQuestion.all
  end

  # GET /health_dec_questions/1 or /health_dec_questions/1.json
  def show
  end

  # GET /health_dec_questions/new
  def new
    @health_dec_question = HealthDecQuestion.new
  end

  # GET /health_dec_questions/1/edit
  def edit
  end

  # POST /health_dec_questions or /health_dec_questions.json
  def create
    @health_dec_question = HealthDecQuestion.new(health_dec_question_params)

    respond_to do |format|
      if @health_dec_question.save
        format.html { redirect_to health_dec_question_url(@health_dec_question), notice: "Health dec question was successfully created." }
        format.json { render :show, status: :created, location: @health_dec_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @health_dec_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_dec_questions/1 or /health_dec_questions/1.json
  def update
    respond_to do |format|
      if @health_dec_question.update(health_dec_question_params)
        format.html { redirect_to health_dec_question_url(@health_dec_question), notice: "Health dec question was successfully updated." }
        format.json { render :show, status: :ok, location: @health_dec_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @health_dec_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_dec_questions/1 or /health_dec_questions/1.json
  def destroy
    @health_dec_question.destroy

    respond_to do |format|
      format.html { redirect_to health_dec_questions_url, notice: "Health dec question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_dec_question
      @health_dec_question = HealthDecQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def health_dec_question_params
      params.require(:health_dec_question).permit(:question_1, :question_2, :question_3, :question_3_desc, :question_4, :question_4_desc, :question_5_a, :question_5_a_desc, :question_5_b, :question_5_b_desc)
    end
end
