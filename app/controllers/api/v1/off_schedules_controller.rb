class Api::V1::OffSchedulesController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @off_schedules = user.off_schedules
    respond_with paginate(filtered_collection(@off_schedules))
  end

  def create
    respond_with user.off_schedules.create!(off_schedule_params)
  end

  def update
    respond_with user_off_schedule.update!(off_schedule_params)
  end

  def destroy
    respond_with user_off_schedule.destroy!
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def user_off_schedule
    @user_off_schedule ||= user.off_schedules.find(params[:id])
  end

  def off_schedule_params
    params.require(:schedule).permit(
      :day_of_week,
      :start_hour,
      :end_hour
    )
  end
end
