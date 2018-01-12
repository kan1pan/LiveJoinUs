require "#{Rails.root}/app/models/user"
require "#{Rails.root}/app/models/event"
require "#{Rails.root}/app/helpers/events_helper"
require "#{Rails.root}/app/mailers/notice_mailer"
class Auto
  def self.send
    @events = Event.limit(7).order("created_at")
    @users = User.all

    @users.each do |user|
      NoticeMailer.sendmail_event_info(@events, user).deliver
    end

  end
end
