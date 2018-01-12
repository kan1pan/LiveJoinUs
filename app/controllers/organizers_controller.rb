class OrganizersController < ApplicationController
  before_action :set_organizer, only:[:show, :edit, :update, :destroy]

  def new
    if params[:back]
      @organizer = Organizer.new(organizer_params)
    else
      @organizer = Organizer.new
    end
  end

  def show
  end

  def create
    @organizer = Organizer.create(organizer_params)
    @organizer.user_id = current_user.id

    if @organizer.save
      redirect_to events_path, notice: "イベント主催者登録が完了しました！"
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @organizer.update(organizer_params)
      redirect_to events_path, notice: "イベント主催者情報を更新しました！"
    else
      render 'new'
    end
  end

  def confirm
    @organizer = Organizer.new(organizer_params)
    render 'new' if @organizer.invalid?
  end

  private
    def organizer_params
      params.require(:organizer).permit(:name, :daihyo_name, :tel_number, :content, :sns_address, :avatar)
    end

    def set_organizer
      @organizer = Organizer.find_by(user_id: current_user.id)
    end
end
