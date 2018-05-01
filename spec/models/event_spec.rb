require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with a title, date, content, address" do
    event = Event.new(
      title: 'test',
      date: '2018/04/26 00:00:00.000',
      content: 'teeeeeeeest',
      address: '埼玉県さいたま市南区曲本5-1-9'
    )
    expect(event).to be_valid
  end

  it "is invalid without a title" do
    event = Event.new(title:nil)
    event.valid?
    expect(event.errors[:title]).to include("を入力してください")
  end
end
