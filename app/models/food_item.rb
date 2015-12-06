class FoodItem < ActiveRecord::Base
	section_arr = %w[Breakfast Lunch Dinner Drinks]
	validates :name, :price, presence: true
	validates :price, numericality: true
	validates :section, inclusion: { in: section_arr,
									message: ": Your choice is in not #{section_arr}"}
	
	scope :section, -> (section) { where section: section }	
end
