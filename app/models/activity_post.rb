class ActivityPost < ApplicationRecord
  extend FriendlyId
  max_paginates_per 5

  friendly_id :title, use: :slugged

  mount_uploader :image, ImageUploader

  belongs_to :user
  after_initialize :set_defaults
  validate :check_time
  # validate :check_start_date_and_end_date
  validates_presence_of :title, :description, :venue
  # validates_presence_of :start_date, :end_date, :start_time, :end_time

# TODO - MOVE CHECK_TIME METHOD TO PRIVATE

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
