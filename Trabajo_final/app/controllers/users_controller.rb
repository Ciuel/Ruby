class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.accessible_by(current_ability)
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params.compact_blank)
    p @user
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params.compact_blank)
        format.html { redirect_to users_url, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    Appointment.where(user_id: @user.id).destroy_all
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :branch_id)
  end
end
