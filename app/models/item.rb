class Item < ApplicationRecord
	belongs_to :customer
	belongs_to :refer_source, optional: true
	enum status: [:at_shop, :repairing, :repaired, :delivered ]
	validates :name, :model, :brand,:iemi, presence: true
end
