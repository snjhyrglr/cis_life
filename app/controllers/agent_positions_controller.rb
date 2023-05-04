class AgentPositionsController < ApplicationController
  before_action :set_agent_position, only: %i[ show edit update destroy ]

  # GET /agent_positions or /agent_positions.json
  def index
    @agent_positions = AgentPosition.all
  end

  # GET /agent_positions/1 or /agent_positions/1.json
  def show
  end

  # GET /agent_positions/new
  def new
    @agent_position = AgentPosition.new
  end

  # GET /agent_positions/1/edit
  def edit
  end

  # POST /agent_positions or /agent_positions.json
  def create
    @agent_position = AgentPosition.new(agent_position_params)

    respond_to do |format|
      if @agent_position.save
        format.html { redirect_to agent_position_url(@agent_position), notice: "Agent position was successfully created." }
        format.json { render :show, status: :created, location: @agent_position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agent_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agent_positions/1 or /agent_positions/1.json
  def update
    respond_to do |format|
      if @agent_position.update(agent_position_params)
        format.html { redirect_to agent_position_url(@agent_position), notice: "Agent position was successfully updated." }
        format.json { render :show, status: :ok, location: @agent_position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agent_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agent_positions/1 or /agent_positions/1.json
  def destroy
    @agent_position.destroy

    respond_to do |format|
      format.html { redirect_to agent_positions_url, notice: "Agent position was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent_position
      @agent_position = AgentPosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agent_position_params
      params.require(:agent_position).permit(:name, :active)
    end
end
