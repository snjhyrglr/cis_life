# class GroupRemitsController < InheritedResources::Base
class GroupRemitsController < ApplicationController
  before_action :set_group_remit, only: %i[ show edit update destroy ]

  def index
    @group_remits = GroupRemit.all
  end

  def show
    # @members = f_members.where("last_name LIKE ? AND first_name LIKE ? AND middle_name LIKE ?", "%#{params[:last_name_filter]}%", "%#{params[:first_name_filter]}%", "%#{params[:middle_name_filter]}%")
    if params[:search_filter].nil?
      @batches = @group_remit.batches.includes(:coop_member)
      puts "gr - yes"
    else
      @batches = @group_remit.batches.coop_member.joins(:member).where("members.last_name LIKE ? OR members.first_name LIKE ? OR members.middle_name LIKE ? OR batches.status LIKE ?", "%#{params[:search_filter]}%", "%#{params[:search_filter]}%", "%#{params[:search_filter]}%", "%#{params[:search_filter]}%")
      puts "gr - no"
    end
    # paginate members
    # @pagy, @filtered_members = pagy(@members, items: 10)
    @pagy, @filtered_batches  = pagy(@batches)

    # @pagy, @batches = pagy(Batch.where(group_remit_id: @group_remit.id))
  end

  def new
    @group_remit = GroupRemit.new
  end

  def edit
  end

  def create
    @group_remit = GroupRemit.new(GroupRemit_params)

    respond_to do |format|
      if @group_remit.save
        format.html { redirect_to GroupRemit_url(@group_remit), notice: "GroupRemit was successfully created." }
        format.json { render :show, status: :created, location: @group_remit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_remit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group_remit.update(GroupRemit_params)
        format.html { redirect_to GroupRemit_url(@group_remit), notice: "GroupRemit was successfully updated." }
        format.json { render :show, status: :ok, location: @group_remit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_remit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group_remit.destroy

    respond_to do |format|
      format.html { redirect_to group_remits_url, notice: "Group Remit was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private

    def set_group_remit
      @group_remit = GroupRemit.find(params[:id])
    end

    def group_remit_params
      params.require(:group_remit).permit(:name, :description, :moa_id)
    end

end
