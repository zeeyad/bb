class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :order_by_latest, -> { where(status: 1).order('created_at DESC').limit(5)}
  enum status: { submitted: 0, approved: 1, rejected: 2}
end
