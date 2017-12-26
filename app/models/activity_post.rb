class ActivityPost < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  scope :submitted, ->{ where(status: 0)}
  scope :approved, ->{ where(status: 1)}
  scope :rejected, ->{ where(status: 2)}

  belongs_to :user
  after_initialize :set_defaults
  validate :check_time
  validates_presence_of :title, :description, :venue

  validates_presence_of :start_date, :end_date, :start_time, :end_time

# TODO - MOVE CHECK_TIME METHOD TO PRIVATE
	def check_time
	  if ( start_date == end_date ) && ( start_time > end_time)
		  errors.add(:end_time, "can't be in the past while start date equals to end date")
	  end
	end

  def date_in_words
    start_date.strftime("%d %B %Y")
  end

  def get_name_of_day
    start_date.strftime("%A")
  end

  def time_in_words
    start_time.strftime("%I:%M %p")
  end

  def duration_of_days
    (end_date - start_date).to_i
  end

  private

  	def set_defaults
  	  self.start_date ||= Date.today - 6.days
  	end


end
