# README

## Introduction

The V1 of this app has been created with a Rails framework and is gives many features and provides you a few features such :
Creating a job application with name and skills
Creating an applicant with a name and assign him to a job
Match the applicant with a relevant recruiting manager
Create an appointment and add it directly in the relevant calendars at the exact date and time required.
An appointment is set for a standard time of 1h and both recruiter and applicant will receive a reminder the day before the appointment as well as 10 mins before it happens. 


#### The Applicants controller is available: [here](app/controllers/applicants_controller.rb)
#### The Appointments controller is available: [here](app/controllers/appointments_controller.rb)
#### The Calendars controller is available: [here](app/controllers/calendar_controller.rb)
#### The Positions controller is available: [here](app/controllers/positions_controller.rb)
#### The Recruiters controller is available: [here](app/controllers/recruiters_controller.rb)


#### The Applicant model is available: [here](app/models/applicant.rb)
#### The Appointment model is available: [here](app/models/appointment.rb)
#### The Position model is available: [here](app/models/position.rb)
#### The Recruiter model is available: [here](app/models/recruiter.rb)

### The test for the controllers are also available to see in the test file: [here]

### The app is currently hosted on Heroku and can be access directly from the home page on the following URL :
https://recruit-r.herokuapp.com/

At the moment the application has no session and is only built for either a single HR manager or a recruiting team using the same interface. 

The following features would be deployed in the V2 in the near future :
- Devise for authentication
- Possibility for 1 applicant to have multiple positions
