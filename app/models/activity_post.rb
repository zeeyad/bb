class ActivityPost < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  scope :submitted, ->{ where.not(status: 0)}
  scope :approved, ->{ where.not(status: 1)}
  scope :rejected, ->{ where.not(status: 2)}

  belongs_to :user
  after_initialize :set_defaults
  validate :check_time
  validates_presence_of :title, :description, :venue

  validates_presence_of :start_date, :end_date, :start_time, :end_time


  	def check_time
  	  if ( start_date == end_date ) && ( start_time > end_time)
  		  errors.add(:end_time, "can't be in the past while start date equals to end date")
  	  end
  	end

  private

  	def set_defaults
  	  self.start_date ||= Date.today - 6.days
  	end


end
