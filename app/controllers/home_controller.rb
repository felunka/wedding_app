class HomeController < ApplicationController
  def show
    @start_date = Rails.application.credentials.config[:start_date].to_date
    @pictures = Picture.with_attached_data.sorted
  end
end
