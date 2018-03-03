class FollowsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @artist = Artist.find(params[:follow][:followed_id])
    current_user.follow!(@artist)
    respond_with @artist
  end

  def destroy
    @artist = Follow.find(params[:id]).followed
    current_user.unfollow!(@artist)
    respond_with @artist
  end

end
