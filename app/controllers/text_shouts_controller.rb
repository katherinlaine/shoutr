class TextShoutsController < ApplicationController
  def create
    @text_shout = TextShout.new(text_shout_params)
    @photo_shout = PhotoShout.new

    if @text_shout.save
      current_user.shouts.create(content: @text_shout)
      redirect_to root_path
    else
      render "/dashboards/show"
    end

  end

  private

  def text_shout_params
    params.require(:text_shout).permit(:body)
  end
end
