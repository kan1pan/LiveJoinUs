class Search::Artist < Search::Base
  ATTRIBUTES = %i(
    name
    genre
  )

  attr_accessor(*ATTRIBUTES)

  def matches
    # t = ::Artist.arel_table
    results = ::Artist.all
    results = results.where(name: name) if name.present?
    results = results.where(genre: genre) if genre.present?
  end

end
