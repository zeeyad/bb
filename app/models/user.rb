class User < ApplicationRecord
  has_many :module_posts
  has_many :activity_posts
  has_many :event_posts
  has_many :notifications, foreign_key: :recipient_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, 
                    uniqueness: { case_sensitive: false }

  # after_create :send_notification

  def send_notification
  	AdminMailer.new_user(self).deliver
  end
end
