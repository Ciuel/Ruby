class SchedulesController < ApplicationController
  before_action :set_branch
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET branches/1/schedules
  def index
    @schedules = @branch.schedules
  end

  # GET branches/1/schedules/1
  def show
  end

  # GET branches/1/schedules/new
  def new
    @schedule = @branch.schedules.build
  end

  # GET branches/1/schedules/1/edit
  def edit
  end

  # POST branches/1/schedules
  def create
    @schedule = @branch.schedules.build(schedule_params)

    if @schedule.save
      redirect_to([@schedule.branch, @schedule], notice: 'Schedule was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT branches/1/schedules/1
  def update
    p @schedule
    p "="*50
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to branch_schedules_url(@branch), notice: "Schedule was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE branches/1/schedules/1
  def destroy
    @schedule.destroy

    redirect_to branch_schedules_url(@branch)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:branch_id])
    end

    def set_schedule
      p "-----------------------------------"
      puts @branch.id
      puts @branch.schedules.ids

      @schedule = @branch.schedules.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def schedule_params
      params.require(:schedule).permit(:day, :start_time, :end_time)
    end
end
