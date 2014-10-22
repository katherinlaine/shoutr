class PhotoShoutsController < ApplicationController
  def create
    @photo_shout = PhotoShout.new(photo_shout_params)
    @text_shout = TextShout.new

    if @photo_shout.save
      current_user.shouts.create(content: @photo_shout)
      redirect_to root_path
    else
      render "/dashboards/show" 
    end
  end

  private

  def photo_shout_params
    params.require(:photo_shout).permit(:url)
  end
end
