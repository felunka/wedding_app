class RegistrationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_mailer.hotel_registration.subject
  #
  def hotel_registration
    @registration = params[:registration]

    mail to: 'info@freigeist-goettingen.de', subject: 'Buchung Abrufkontingent Josepha&Felix'
  end
end
