class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_branch
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment =  @branch.appointments.build
  end



  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = @branch.appointments.build(appointment_params.merge(user_id: current_user.id))

    if @appointment.save
      redirect_to([@appointment.branch, @appointment], notice: 'Appointment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to branch_appointments_url(@branch), notice: "Appointment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def set_branch
    @branch = Branch.find(params[:branch_id])
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
