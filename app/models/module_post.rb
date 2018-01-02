class ModulePost < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  validates_presence_of :title, :description

  scope :before_a_month, -> { where('created_at >= ?', Time.now - 29.days )}
  scope :more_than_a_month, -> { where('created_at < ?', Time.now - 30.days )}

end
