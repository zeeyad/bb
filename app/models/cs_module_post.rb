class CsModulePost < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2}
  belongs_to :user
  validates_presence_of :title, :description
end
