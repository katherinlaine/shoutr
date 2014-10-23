class SearchesController < ApplicationController
  def show
    text_shouts = TextShout.where("body ILIKE ?", "%#{params[:query]}%")
    @shouts = Shout.where(content_type: "TextShout", content_id: text_shouts.pluck(:id))
    @users = User.where("username ILIKE ?", "%#{params[:query]}%")
  end
end
