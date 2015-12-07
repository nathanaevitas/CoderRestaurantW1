module FoodItemsHelper
	def sortable (column, title =nil)
		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		section = sort_section
		link_to title, {sort: column, direction: direction, section: section}, {class: css_class}
	end
end
