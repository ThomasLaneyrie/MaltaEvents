class Event < ApplicationRecord
  validates :start_date, presence: true, date: {after: Proc.new { Time.now }}   
  validate :duration_validate
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 1000 } 
  validates :location, presence: true 

  def duration_validate
    if duration <= 0 || duration % 5 != 0
      errors.add(:duration, {message: 'Le champ doit être positif'})
    end
  end

  belongs_to :administrator, class_name: "User"
  has_many :attendants, class_name: "User", through: :attendance
end
