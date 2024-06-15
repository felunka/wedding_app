class HomeController < ApplicationController
  def show
    @start_date = Rails.application.credentials.config[:start_date].to_date
    @registration = Registration.new
    @registration.registration_entries = [RegistrationEntry.new]
  end
end
