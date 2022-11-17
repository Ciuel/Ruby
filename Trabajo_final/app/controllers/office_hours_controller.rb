class OfficeHoursController < ApplicationController
  before_action :set_office_hour, only: %i[ show edit update destroy ]
  before_action :get_branch

  # GET /office_hours or /office_hours.json
  def index
    @office_hours = OfficeHour.where(branch_id: @branch.id)
  end

  # GET /office_hours/1 or /office_hours/1.json
  def show
  end

  # GET /office_hours/new
  def new
    @office_hour = OfficeHour.new
  end

  # GET /office_hours/1/edit
  def edit
  end

  # POST /office_hours or /office_hours.json
  def create
    @office_hour = OfficeHour.new(office_hour_params)

    respond_to do |format|
      if @office_hour.save
        format.html { redirect_to office_hour_url(@office_hour), notice: "Office hour was successfully created." }
        format.json { render :show, status: :created, location: @office_hour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @office_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_hours/1 or /office_hours/1.json
  def update
    respond_to do |format|
      if @office_hour.update(office_hour_params)
        format.html { redirect_to office_hour_url(@office_hour), notice: "Office hour was successfully updated." }
        format.json { render :show, status: :ok, location: @office_hour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @office_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_hours/1 or /office_hours/1.json
  def destroy
    @office_hour.destroy

    respond_to do |format|
      format.html { redirect_to office_hours_url, notice: "Office hour was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_hour
      @office_hour = OfficeHour.find(params[:id])
    end

    def get_branch
      @branch = Branch.find(params[:branch_id])
    end

    # Only allow a list of trusted parameters through.
    def office_hour_params
      params.require(:office_hour).permit(:day, :start, :end, :branch_id)
    end
end
