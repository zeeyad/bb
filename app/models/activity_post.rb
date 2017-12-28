class ActivityPost < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  scope :submitted, ->{ where(status: 0)}
  scope :approved, ->{ where(status: 1)}
  scope :rejected, ->{ where(status: 2)}

  scope :not_passed, ->{ where("start_date >= ?", Date.today)}
  scope :desc, ->{ order(updated_at: :DESC)}

  belongs_to :user
  after_initialize :set_defaults
  validate :check_time
  validate :check_start_date_and_end_date
  validates_presence_of :title, :description, :venue

  validates_presence_of :start_date, :end_date, :start_time, :end_time

# TODO - MOVE CHECK_TIME METHOD TO PRIVATE
	def check_time
	  if ( start_date == end_date ) && ( start_time > end_time)
		  errors.add(:start_time, "can not be earlier than end time considering it is on the same day")
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
  	  self.start_date ||= Date.today
      self.end_date ||= Date.today + 3.days
  	end

    def check_start_date_and_end_date
      if (start_date && end_date != nil ) && (start_date > end_date)
        errors.add(:start_date, "can not be earlier than end date")
      end
    end

end
