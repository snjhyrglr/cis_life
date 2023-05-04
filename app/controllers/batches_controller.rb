# class BatchesController < InheritedResources::Base
class BatchesController < ApplicationController
  before_action :set_batch, only: %i[ show edit update destroy ]


  def index
    @batches = Batch.all
  end

  def show
    @health_dec = @batch.health_dec_question
    @batch_health_dec = @batch.batch_health_dec
  end

  def new
    @batch = Batch.new
  end

  def edit
  end

  def create
    @batch = Batch.new(batch_params)

    respond_to do |format|
      if @batch.save
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully created." }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to batch_url(@batch), notice: "Batch was successfully updated." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url, notice: "Batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_batch
      @batch = Batch.find(params[:id])
    end

    def batch_params
      params.require(:batch).permit(:coop_member_id, :group_remit_id, :effectivity_date, :expiry_date, :active, :coop_sf_amount, :agent_sf_amount)
    end

end
