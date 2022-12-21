class CustomerItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  belongs_to :refer_source, optional: true
  enum status: [ :item_in_hand, :in_progress, :repaired, :delivered ]

  validates :issue_details,:status, presence: true

end
