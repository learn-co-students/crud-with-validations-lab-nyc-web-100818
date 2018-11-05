class YearValidator < ActiveModel::Validator
  def validate(record)
    if record.released == true
      if record.released == nil
        record.errors[:release_year] << 'Year must be valid'
      end
      unless record.release_year && record.release_year <= Time.now.year
        record.errors[:release_year] << 'Year must be valid'
      end
    end
  end
end

class Song < ActiveRecord::Base
  include ActiveModel::Validations

  validates :title, presence: true
  validates :title, uniqueness: true
  # validates :released, inclusion: { in: %w(true false)}
  validates_with YearValidator

end
