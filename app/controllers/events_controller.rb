class EventsController < ApplicationController
  before_action :set_event, only:[:show, :edit, :update, :destroy, :showlink]
  before_action :authenticate_user!, except: [:index, :show, :searchinfo, :search, :tutorial, :bygenre]
  before_action :delete_event, only:[:index]

  def tutorial
  end

  def index
    @events = Event.all.order(created_at: :desc)
    @events = Event.page(params[:page]).per(5)
    @artists = Artist.all.order(accsess_count: :desc).limit(5)
  end

  def myevents
    @organizer = Organizer.find_by(user_id: current_user.id)
    @events = Event.where(organizer_id: @organizer.id)
    @events = @events.page(params[:page]).per(5)
  end

  def bygenre
    @events = Event.where(genre:params[:genre_id]).order(created_at: :desc)
    @events = @events.page(params[:page]).per(5)
  end

  def show
    @events = Event.all
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.json({name: event.address})
    end
  end

  def showlink
    @events = Event.all
    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.json({name: event.address})
    end
    render 'show' if user_signed_in?
  end

  def new
    if params[:back]
      @event = Event.new(events_params)
    else
      @event = Event.new
    end
  end

  def create
    @event = Event.create(events_params)
    @organizer = Organizer.find_by(user_id: current_user.id)
    @event.organizer_id = @organizer.id
    if @event.save
      redirect_to events_path, notice: 'イベントを投稿しました！'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    unless params[:action_name].blank?
      if params[:action_name] == 'participation'
        participation
      end
    else
      if @event.update(events_params)
        redirect_to events_path, notice: 'イベント内容を変更しました！'
      else
        render 'new'
      end
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'イベントを削除しました！'
  end

  def confirm
    @event = Event.new(events_params)
    render :new if @event.invalid?
  end

  def participation
    redirect_to participation_participants_path(params[:id])
  end

  def searchinfo
    if params[:link_name] == 'event'
      @q = Event.ransack(params[:q])
    else
      @q = Artist.ransack(params[:q])
    end
  end

  def search
    respond_to do |format|
      if params[:id] == 'event'
        @model = Event.new
      else
        @model = Artist.new
      end
      @results = @model.search(params[:q], params[:page])

      format.html
      format.js { render :searchinfo }
    end
  end

  private
    def events_params
      params.require(:event).permit(:title, :date, :content, :genre, :image, :image_cache, :place, :address, :latitude, :longitude)
    end

    def search_event_params
      params.require(:search_event).permit(Search::Event::ATTRIBUTES)
    end

    def search_artist_params
      params.require(:search_artist).permit(Search::Artist::ATTRIBUTES)
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def delete_event
      Event.delete_event
    end

end
