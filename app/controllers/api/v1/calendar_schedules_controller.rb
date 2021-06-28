class Api::V1::CalendarSchedulesController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show, :create]

  def index
    @calendar_schedules = user.calendar_schedules.where(calendar_schedule_params)
    respond_with paginate(filtered_collection(@calendar_schedules))
  end

  def show
    respond_with user_calendar_schedule
  end

  def create
    # skip auth due to post coming from mobile and mobile not having any users
    respond_with user.calendar_schedules.create!(calendar_schedule_params)
    # mandar mail a reservador
    # mandar mail a dueño de la propiedad
    # contenido: hablense
  end

  def update
    respond_with user_calendar_schedule.update!(calendar_schedule_params)
  end

  def destroy
    respond_with user_calendar_schedule.destroy!
  end

  private

  def user
    @user ||= User.find(params[:user_id])
  end

  def user_calendar_schedule
    @user_calendar_schedule ||= user.calendar_schedules.find(params[:id])
  end

  def calendar_schedule_params
    params.require(:schedule).permit(
      :property_id,
      :start_date,
      :end_date,
      :reserver_email,
      :reserver_name
    )
  end
end
