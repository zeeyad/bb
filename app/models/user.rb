class User < ApplicationRecord
  has_many :module_posts
  has_many :activity_posts
  has_many :event_posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username

  # after_create :send_notification

  def send_notification
  	AdminMailer.new_user(self).deliver
  end
end
