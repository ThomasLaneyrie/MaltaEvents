class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # Liens entre les tables
  has_many :administrates, foreign_key: 'administrator_id', class_name: "Event"
  has_many :attendances, foreign_key: 'attendant_id'
  has_many :events, through: :attendances
  has_one_attached :avatar   

  # Mailers 
  after_create :welcome_send                                 
  def welcome_send
    UserMailer.welcome_email(self).deliver_now              
  end                                         
end
