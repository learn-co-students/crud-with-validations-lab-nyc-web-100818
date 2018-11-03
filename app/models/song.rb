class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :artist_name && :release_year,
    message: "that song has already been released!"
  }
  validates :artist_name, presence: true
  validates :genre, presence: true


  with_options if: :is_released? do |song|
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    song.validates :release_year, presence: true
  end

  def is_released?
    self.released
  end

end
