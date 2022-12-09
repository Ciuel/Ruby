class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_branch
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    if current_user.staff?
      @appointments = @branch.appointments.accessible_by(current_ability)
    else
      @appointments = Appointment.accessible_by(current_ability)
    end

  end

  # GET /appointments/new
  def new
    @appointment = @branch.appointments.build
  end

  #PATCH /appointments/1/edit

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = @branch.appointments.build(appointment_params.merge(user_id: current_user.id))

    if @appointment.save
      redirect_to branch_appointments_url(@branch), notice: 'Appointment was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    if @appointment.status == "pending"
      if params[:status] == 'finished'
        @appointment.status = :finished
        @appointment.staff_id = current_user.id
      elsif params[:status] == 'canceled'
        @appointment.status = :canceled
      end
    end
    if current_user.admin?
      params = appointment_params.compact_blank
    end
    respond_to do |format|
      if @appointment.update(params)
        format.html { redirect_to branch_appointments_url(@branch), notice: "Appointment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    if current_user.client?
      if @appointment.status == "pending"
        p @appointment.status
        @appointment.status = :canceled
        p @appointment.status
        @appointment.save!

      end
    else
      @appointment.destroy
    end
    respond_to do |format|
      format.html { redirect_to branch_appointments_path, notice: "Appointment was canceled." }
    end
  end

  def set_branch
    if params[:branch_id]
      @branch = Branch.find(params[:branch_id])
    elsif current_user.staff?
      @branch = current_user.branch

    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:branch_id, :date, :reason, :comment, :staff_id)
  end
end
