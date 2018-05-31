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
    @artist = Artist.pickup_artist(params[:back])
  end

  def create
    @artist = Artist.create(Artist.artist_params(params))
    @artist.user_id = current_user.id

    if @artist.save
      redirect_to root_path, notice: "アーティスト登録が完了しました！"
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @artist.update(Artist.artist_params(params))
      redirect_to root_path, notice: "アーティスト情報を更新しました！"
    else
      render 'new'
    end
  end

  def confirm
    @artist = Artist.new(Artist.artist_params(params))
    render 'new' if @artist.invalid?
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def set_loginUser
      if user_signed_in?
        @loginUser =  current_user.organizer_flg ? Organizer.get_loginUser(current_user.id) : Artist.get_loginUser(current_user.id)
      end
    end

end
