class Item < ApplicationRecord
	has_many :customer_items, dependent: :destroy
	has_many :customer, through: :customer_items
end
