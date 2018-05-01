class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :date, presence: true
  validates :content, presence: true
  validates :address, presence: true


  belongs_to :organizer
  belongs_to :reversenomination

  mount_uploader :image, ImageUploader

  enum genre:{初ライブデビュー向け！:"1", 新規アーティスト歓迎！:"2", ジャンル縛りライブ！:"3", みんな祭りだオールジャンル！:"4", その他:"5"}

  geocoded_by :address
  after_validation :geocode, if: lambda {|obj| obj.address_changed?}

  def search(conditions, page)
    q = Event.ransack(conditions)
    results = q.result
    results = results.page(page).per(5)
  end

  def self.delete_event
    events = Event.all
    
    events.each do |event|
      if Date.today > event.date
        event.delete
      end
    end
  end

end
