class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update]

  def create
  end

  def edit
  end

  def update
    @user.update(organizer_flg: params[:user][:organizer_flg])
    if @user.organizer_flg
      redirect_to new_organizer_path(user_id: @user.id, event:'sns')
    else
      redirect_to new_artist_path(user_id: @user.id, event:'sns')
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
