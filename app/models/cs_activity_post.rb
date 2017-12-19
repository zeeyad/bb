class CsActivityPost < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2}
  belongs_to :user
  after_initialize :set_defaults
  validate :check_time
  validates_presence_of :title, :description, :venue

  validates_presence_of :start_date, :end_date, :start_time, :end_time


  	def check_time
	  if ( start_date == end_date ) && ( start_time > end_time)
		errors.add(:end_time, "can't be in the past")
  	  end
  	end

  private

  	def set_defaults
  	  self.start_date ||= Date.today - 6.days
  	end


end
