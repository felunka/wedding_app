class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end

  def create
    @registration = Registration.new permit(params)

    respond_to do |format|
      if @registration.save
        if @registration.is_with_hotel_booking
          RegistrationMailer.with(registration: @registration).hotel_registration.deliver_later
          flash[:success] = t('messages.registration.created_with_hotel')
        else
          flash[:success] = t('messages.registration.created')
        end
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
      end
    end
  end

  def permit(params)
    params.require(:registration).permit(
      :hotel_email,
      :hotel_number_double_rooms,
      :hotel_number_single_rooms,
      :hotel_number_of_adults,
      :hotel_number_of_children,
      :hotel_start_date,
      :hotel_end_date,
      :hotel_comments,
      registration_entries_attributes: %i[
        name
        food_selection
        comment
        all_days
        _destroy
      ]
    )
  end
end
