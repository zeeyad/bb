class User < ApplicationRecord
  has_many :cs_module_posts
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
