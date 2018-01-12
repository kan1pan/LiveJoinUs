class Search::Event < Search::Base
  ATTRIBUTES = %i(
    date
    content
    title
  )

  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::Event.arel_table
    results = ::Event.all
    results = results.where(contains(t[:date], date)) if date.present?
    results = results.where(contains(t[:content], content)) if content.present?
    results = results.where(contains(t[:title], title)) if title.present?
    results = results.where("content LIKE '%#{content}%'") if content.present?
  end

end
