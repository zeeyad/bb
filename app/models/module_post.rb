class ModulePost < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  validates_presence_of :title, :description

end
