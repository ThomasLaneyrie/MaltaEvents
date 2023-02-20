class Attendance < ApplicationRecord
  belongs_to :attendant, class_name: "User"
  belongs_to :event
end
