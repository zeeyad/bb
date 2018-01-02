class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  enum status: { submitted: 0, approved: 1, rejected: 2}

  # POST STATUS
  scope :submitted, ->{ where(status: 0)}
  scope :approved, ->{ where(status: 1)}
  scope :rejected, ->{ where(status: 2)}

  # CONTOLLER SATTUS
  scope :passed, ->{ where("end_date < ?", Date.today)}
  scope :not_passed, ->{ where("start_date >= ?", Date.today)}
  scope :desc, ->{ order(updated_at: :DESC)}

  # HOMEPAGE LISTING 
  scope :order_by_latest_and_not_passed, -> { where(status: 1).order('created_at DESC').limit(5).not_passed}
  scope :order_by_latest, -> { where(status: 1).order('created_at DESC').limit(5)}


  def date_in_words
    start_date.strftime("%d %B %Y")
  end

  def end_date_in_words
    end_date.strftime("%d %B %Y")
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

  def check_time
    if ( start_date == end_date ) && ( start_time > end_time)
      errors.add(:start_time, "can not be earlier than end time considering it is on the same day")
    end
  end

end
