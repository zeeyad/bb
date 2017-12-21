class EventPost < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user

  validates_presence_of :title, :description, :venue
  validates_presence_of :start_date, :end_date, :start_time, :end_time
end
