class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :not_passed, ->{ where("start_date >= ?", Date.today)}
  scope :order_by_latest_and_not_passed, -> { where(status: 1).order('created_at DESC').limit(5).not_passed}
  scope :order_by_latest, -> { where(status: 1).order('created_at DESC').limit(5)}
  enum status: { submitted: 0, approved: 1, rejected: 2}
end
