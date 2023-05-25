class MemberDependentsController < ApplicationController
  before_action :set_member_dependent, only: %i[ show edit update destroy ]

  # GET /member_dependents or /member_dependents.json
  def index
    @member_dependents = MemberDependent.all
  end

  # GET /member_dependents/1 or /member_dependents/1.json
  def show
  end

  # GET /member_dependents/new
  def new
    if Rails.env.development?
      @member_dependent = MemberDependent.new(
        last_name: FFaker::NamePH.last_name,
        first_name: FFaker::NamePH.first_name,
        middle_name: FFaker::NamePH.last_name,
        birthdate: Date.today-rand(25000),
        relationship: MemberDependent::RELATIONSHIPS.sample
      )
    else
      @member_dependent = MemberDependent.new
    end
  end

  # GET /member_dependents/1/edit
  def edit
  end

  # POST /member_dependents or /member_dependents.json
  def create
    @member_dependent = MemberDependent.new(member_dependent_params)

    respond_to do |format|
      if @member_dependent.save
        format.html { redirect_to member_dependent_url(@member_dependent), notice: "Member dependent was successfully created." }
        format.json { render :show, status: :created, location: @member_dependent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member_dependent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_dependents/1 or /member_dependents/1.json
  def update
    respond_to do |format|
      if @member_dependent.update(member_dependent_params)
        format.html { redirect_to member_dependent_url(@member_dependent), notice: "Member dependent was successfully updated." }
        format.json { render :show, status: :ok, location: @member_dependent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member_dependent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_dependents/1 or /member_dependents/1.json
  def destroy
    @member_dependent.destroy

    respond_to do |format|
      format.html { redirect_to member_dependents_url, notice: "Member dependent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_dependent
      @member_dependent = MemberDependent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_dependent_params
      params.require(:member_dependent).permit(:last_name, :first_name, :middle_name, :suffix, :birthdate, :member_id, :relationship)
    end
end
