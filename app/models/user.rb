class User < ApplicationRecord
  has_many :administrates, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendances, foreign_key: 'attendant_id'
end
