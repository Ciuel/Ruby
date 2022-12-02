class AppointmentsController < ApplicationController
  before_action :authenticate_user!
<<<<<<< HEAD
=======
  before_action :set_branch
>>>>>>> 65cdee8b34e675319b8054d1563234f91c5f47c1
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
<<<<<<< HEAD
    @appointment = Appointment.new
  end

=======
    @appointment =  @branch.appointments.build
  end



>>>>>>> 65cdee8b34e675319b8054d1563234f91c5f47c1
  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
<<<<<<< HEAD
    @appointment = Appointment.new(appointment_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
=======
    @appointment = @branch.appointments.build(appointment_params.merge(user_id: current_user.id))

    if @appointment.save
      redirect_to([@appointment.branch, @appointment], notice: 'Appointment was successfully created.')
    else
      render action: 'new'
>>>>>>> 65cdee8b34e675319b8054d1563234f91c5f47c1
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
<<<<<<< HEAD
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
=======
        format.html { redirect_to branch_appointments_url(@branch), notice: "Appointment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
>>>>>>> 65cdee8b34e675319b8054d1563234f91c5f47c1
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
<<<<<<< HEAD

=======
  def set_branch
    @branch = Branch.find(params[:branch_id])
  end
>>>>>>> 65cdee8b34e675319b8054d1563234f91c5f47c1
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
