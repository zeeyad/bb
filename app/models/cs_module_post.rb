class CsModulePost < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum status: { submitted: 0, approved: 1, rejected: 2}
  belongs_to :user
  validates_presence_of :title, :description

end
