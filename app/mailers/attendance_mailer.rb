class AttendanceMailer < ApplicationMailer
  default from: 'zaritus3@hotmail.com'   
  def welcome_to_new_attendance(attendance)               
    @attendance = attendance                                                    
    @url  = 'http://monsite.fr/login'                               
    mail(to: @attendance.attendant.email, subject: 'Bienvenue chez nous !')
  end
end


