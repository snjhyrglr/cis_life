class CoopUsersController < ApplicationController
  before_action :set_coop_user, only: %i[ show edit update destroy ]

  def home
  end
  
  # GET /coop_users or /coop_users.json
  def index
    @coop_users = CoopUser.all
  end

  # GET /coop_users/1 or /coop_users/1.json
  def show
  end

  # GET /coop_users/new
  def new
    @coop_user = CoopUser.new(last_name: FFaker::Name.last_name, first_name: FFaker::Name.first_name, middle_name: FFaker::Name.last_name, mobile_number: FFaker::PhoneNumber, designation: FFaker::String)
    
    # new instance of the "User" class associated with the "Coop_user" instance.
    @coop_user.build_user
  end

  # GET /coop_users/1/edit
  def edit
  end

  # POST /coop_users or /coop_users.json
  def create
    @coop_user = CoopUser.new(coop_user_params)

    respond_to do |format|
      if @coop_user.save
        format.html { redirect_to unauthenticated_root_path, notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @coop_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coop_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coop_users/1 or /coop_users/1.json
  def update
    respond_to do |format|
      if @coop_user.update(coop_user_params)
        format.html { redirect_to coop_user_url(@coop_user), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @coop_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coop_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coop_users/1 or /coop_users/1.json
  def destroy
    @coop_user.destroy

    respond_to do |format|
      format.html { redirect_to coop_users_url, notice: "Coop User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coop_user
      @coop_user = CoopUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coop_user_params
      params.require(:coop_user).permit(:last_name, :first_name, :middle_name, :birthdate, :mobile_number, :designation, :cooperative_id, :coop_branch_id, user_attributes: [:email, :password, :password_confirmation, :userable_type, :userable_id])
    end
end
