class PicturesController < ApplicationController
  def index
    @pictures = Picture.with_attached_data.sorted
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find_by params.permit(:id)
  end

  def create
    max_sort_index = Picture.maximum(:sort_index)
    permitted_params = permit(params)
    permitted_params[:data].reject!(&:blank?).each do |file|
      max_sort_index += 1

      pic = Picture.new
      pic.picture_type = permitted_params[:picture_type]
      pic.data = file
      pic.sort_index = max_sort_index

      pic.save!
    end
  end

  def update
    @picture = Picture.find_by params.permit(:id)
    @picture.update params.require(:picture).permit(:picture_type, :slot_size, :sort_index)

    redirect_to action: 'index'
  end

  def destroy
    Picture.find_by(params.permit(:id)).destroy
    redirect_to action: 'index'
  end

  def permit(params)
    params.require(:picture).permit(
      :picture_type,
      data: []
    )
  end
end
