class User < ApplicationRecord
  # Liens entre les tables
  has_many :administrates, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendances, foreign_key: 'attendant_id'

  # Mailers 
  after_create :welcome_send                                 
  def welcome_send
    UserMailer.welcome_email(self).deliver_now              
  end                                         

end
