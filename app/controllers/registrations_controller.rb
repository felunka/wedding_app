class RegistrationsController < ApplicationController
  def index
    @registration = Registration.all
  end

  def create
    @registration = Registration.new permit(params)

    respond_to do |format|
      if @registration.save
        flash[:success] = t('messages.registration.created')
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
      end
    end
  end

  def permit(params)
    params.require(:registration).permit(
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
