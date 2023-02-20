class Attendance < ApplicationRecord
  belongs_to :attendant, class_name: "User"
  belongs_to :event

  after_create :welcome_to_new_attendance_send                                 
  def welcome_to_new_attendance_send 
    AttendanceMailer.welcome_to_new_attendance(self).deliver_now              
  end                             
end
