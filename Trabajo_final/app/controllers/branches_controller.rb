class BranchesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_branch, only: %i[ show edit update destroy ]

  # GET /branches or /branches.json
  def index
    @branches = Branch.all
  end


  # GET /branches/new
  def new
    @branch = Branch.new
  end

  # GET /branches/1/edit
  def edit
  end

  # POST /branches or /branches.json
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branches_url, notice: "Sucursal #{@branch.name} creada" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1 or /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to branches_url, notice: "Sucursal #{@branch.name} actualizada" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1 or /branches/1.json
  def destroy
    # if there are no pending appointments for this branch, delete it, otherwise show an error message
    if @branch.appointments.where(status: :pending).empty?
      @branch.appointments.where.not(status: :pending).destroy_all
      name=@branch.name
      @branch.destroy
      respond_to do |format|
        format.html { redirect_to branches_url, notice: "Sucursal #{name} borrada" }
      end
    else
      redirect_to branches_url, notice: "La sucursal no puede ser borrada, hay turnos pendientes"
    end

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_branch
    @branch = Branch.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def branch_params
    params.require(:branch).permit(:name, :address, :telephone)
  end
end
