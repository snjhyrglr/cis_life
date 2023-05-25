class BatchDependentsController < ApplicationController
  before_action :set_batch_dependent, only: %i[ show edit update destroy ]

  # GET /batch_dependents or /batch_dependents.json
  def index
    @batch_dependents = BatchDependent.all
  end

  # GET /batch_dependents/1 or /batch_dependents/1.json
  def show
  end

  # GET /batch_dependents/new
  def new
    @batch_dependent = BatchDependent.new
  end

  # GET /batch_dependents/1/edit
  def edit
  end

  # POST /batch_dependents or /batch_dependents.json
  def create
    # raise 'errors'
    @batch_dependent = BatchDependent.new(batch_dependent_params)

    respond_to do |format|
      if @batch_dependent.save

        @batch_dependent.get_prem

        format.html { redirect_to batch_dependent_url(@batch_dependent), notice: "Batch dependent was successfully created." }
        format.json { render :show, status: :created, location: @batch_dependent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch_dependent.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  def selected 
    @target = params[:target]
    puts "params - #{params[:target]}"
    @coop_mem = Batch.find(params[:id]).coop_member_id
    @cm = CoopMember.find(@coop_mem).member_id
    @member_dependents = MemberDependent.where(member_id: @cm)
    puts "#{@member_dependents}"
    respond_to do |format|
      format.turbo_stream
    end
  end

  def selected2 
    @target2 = params[:target2]
    puts "params2 - #{params[:target2]}"
    @batch = Batch.find(params[:id]).coop_member_id
    @moa = GroupRemit.find(@batch).moa_id
    @pro = Moa.find(@moa).proposal_id
    @insured_types = ProposalInsured.where(proposal_id: @pro)
    puts "#{@insured_type}"
    respond_to do |format|
      format.turbo_stream
    end
  end

  # PATCH/PUT /batch_dependents/1 or /batch_dependents/1.json
  def update
    respond_to do |format|
      if @batch_dependent.update(batch_dependent_params)
        format.html { redirect_to batch_dependent_url(@batch_dependent), notice: "Batch dependent was successfully updated." }
        format.json { render :show, status: :ok, location: @batch_dependent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_dependent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_dependents/1 or /batch_dependents/1.json
  def destroy
    @batch_dependent.destroy

    respond_to do |format|
      format.html { redirect_to batch_dependents_url, notice: "Batch dependent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_dependent
      @batch_dependent = BatchDependent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def batch_dependent_params
      params.require(:batch_dependent).permit(:batch_id, :member_dependent_id, :premium, :proposal_insured_id)
    end
end
