class NoticeMailer < ApplicationMailer

  def sendmail_contact(contact)
    @contact = contact

    mail(
      to: @contact.email,
      subject: '問い合わせありがとうございます。'
    ) do |format|
      format.text
    end
  end

  def sendmail_contact_admin(contact)
    @contact = contact

    mail(
      to: ENV['ADMIN_ADDRESS'],
      subject: '利用者様より問い合わせがありました。'
    ) do |format|
      format.text
    end
  end

  def sendmail_participant(event, user, artist, participant, user_session)
    @event = event
    @user = user
    @artist = artist
    @participant = participant
    @session = user_session
    mail(
      to: @user.email,
      subject: 'イベント参加ありがとうございます！'
    ) do |format|
      format.text
    end
  end

  def sendmail_event_info(events, user)
    @events = events
    @user = user
    if @user.organizer_flg
      @model = Organizer.find_by(user_id: @user.id)
    else
      @model = Artist.find_by(user_id: @user.id)
    end

    mail(
      to: user.email,
      subject: '新着イベントのお知らせ'
    ) do |format|
      format.html
    end
  end

end
