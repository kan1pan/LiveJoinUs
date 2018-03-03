class ArtistsController < ApplicationController
  before_action :set_artist, only:[:show, :edit, :update, :destroy]
  before_action :set_loginUser, only:[:index, :show, :edit, :update, :destroy]

  def index
    @followeds = current_user.followed_users
    @followers = current_user.followers
  end

  def show
    if @artist.id != params[:id]
      @artist.accsess_count += 1
      @artist.save
    end
  end

  def new
    if  params[:back]
      @artist = Artist.new(artist_params)
    else
      @artist = Artist.new
    end
  end

  def create
    @artist = Artist.create(artist_params)
    @artist.user_id = current_user.id

    if @artist.save
      redirect_to events_path, notice: "アーティスト登録が完了しました！"
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to events_path, notice: "アーティスト情報を更新しました！"
    else
      render 'new'
    end
  end

  def confirm
    @artist = Artist.new(artist_params)
    render 'new' if @artist.invalid?
  end

  private
    def artist_params
      params.require(:artist).permit(:name, :genre, :self_introduction, :singing, :singing_cache, :play_video, :play_video_cache, :avatar, :avatar_cache)
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def set_loginUser
      if user_signed_in?
        if current_user.organizer_flg == true
          @loginUser = Organizer.find_by(user_id: current_user.id)
        else
          @loginUser = Artist.find_by(user_id: current_user.id)
        end
      end
    end

end
