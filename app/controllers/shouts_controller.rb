class ShoutsController < ApplicationController
  def new
    @shout = Shout.new
  end
  
  def create
    @shout = current_user.shouts.new(shout_params)
    @shout.save
    redirect_to dashboard_path
  end

  private

  def shout_params
    params.require(:shout).permit(:content)
  end
end
