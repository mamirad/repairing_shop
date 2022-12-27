class Customer < ApplicationRecord
	has_many :items, dependent: :destroy
	accepts_nested_attributes_for :items, :allow_destroy => true
	validates :name, :phone, presence: true
end
