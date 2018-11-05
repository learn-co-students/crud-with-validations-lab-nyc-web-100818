class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "Title cannot be repeated more than once per year" }

  validates :released, inclusion: { in: [true, false],
    message: "%{released} is not a valid option true or false of whether the song was ever released officially" }

  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than: Date.today.year}, allow_nil: true


  def released?
    self.released
  end

end
