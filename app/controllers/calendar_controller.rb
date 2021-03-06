class CalendarController < ApplicationController
  def redirect
    client = Signet::OAuth2::Client.new(client_options)

    redirect_to client.authorization_uri.to_s
  end

    def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]

    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to calendars_url
  end



  def calendars
    @applicant = Applicant.last
    @recruiter = Recruiter.find(@applicant.recruiter_id)
    @date = Appointment.last.datetime.strftime("%a, %e %b %Y %H:%M")
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @calendar_list = service.list_calendar_lists
    rescue Google::Apis::AuthorizationError
    response = client.refresh!
  end


def new_event

    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    today = Date.today

    applicant = Applicant.last
    recruiter = Recruiter.find(applicant.recruiter_id)

    applicant_attendee = Google::Apis::CalendarV3::EventAttendee.new
    applicant_attendee.email = applicant.email

    recruiter_attendee = Google::Apis::CalendarV3::EventAttendee.new
    recruiter_attendee.email = recruiter.email

    @event = Google::Apis::CalendarV3::Event.new({
      start: Google::Apis::CalendarV3::EventDateTime.new({date_time: Appointment.last.datetime.rfc3339 }),
      end: Google::Apis::CalendarV3::EventDateTime.new({date_time: (Appointment.last.datetime.+3600).rfc3339 }),
      summary: "#{applicant.first_name} meets #{recruiter.name}",
      attendees: [applicant_attendee, recruiter_attendee]
      #attendees: ArrayGoogle::Apis::CalendarV3::EventAttendee(Applicant.last.first_name)

    })

    notification = Google::Apis::CalendarV3::Event::Reminders.new({
      delivery_method: "email"
    })



    service.insert_event('primary', @event) do | result, err|
      if err.nil?
        result.html_link
      end
    end
    redirect_to appointment_confirmed_path
  end



  private

  def client_options
    {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url
    }
  end
end
