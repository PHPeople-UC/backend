class Api::V1::CalendarSchedulesController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show, :create]

  def index
    @calendar_schedules = user.calendar_schedules
    respond_with paginate(filtered_collection(@calendar_schedules))
  end

  def show
    respond_with user_calendar_schedule
  end

  def create
    reserver_email = params[:schedule][:reserver_email]

    initial_date = calendar_schedule_params[:start_date].to_date
    final_date = calendar_schedule_params[:end_date].to_date

    propietary_email = Property.find(calendar_schedule_params[:property_id]).user.email
    property_name = Property.find(calendar_schedule_params[:property_id])[:name]
    property_direction = Property.find(calendar_schedule_params[:property_id])[:address]
    from = SendGrid::Email.new(email: 'phpeopleuc@gmail.com')
    subject = 'Agenda hora propiedad'
    to = SendGrid::Email.new(email: reserver_email)
    content = SendGrid::Content.new(type: 'text/plain',
                                    value: "Estimado \n Le informamos que se ha agendado exitosamente la hora para ver la propiedad #{property_name}, en la direccion #{property_direction}, el día #{initial_date.strftime('%d-%m-%Y desde %H:%M')} hasta las #{final_date.strftime('%H:%M')}, el email del dueño de la publicación es #{propietary_email}, para que lo contacte a la brevedad \n Saludos PHpeople")
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    to = SendGrid::Email.new(email: propietary_email)
    content = SendGrid::Content.new(type: 'text/plain',
                                    value: "Estimado \n Le informamos que se ha agendado exitosamente la hora para ver su propiedad #{property_name}, en la direccion #{property_direction}, el día #{initial_date.strftime('%d-%m-%Y desde %H:%M')} hasta las #{final_date.strftime('%H:%M')},  el email del interesado  es #{reserver_email}, para que lo contacte a la brevedad \n Saludos PHpeople")
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    respond_with user.calendar_schedules.create!(calendar_schedule_params)
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
