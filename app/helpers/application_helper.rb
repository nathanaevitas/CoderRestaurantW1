module ApplicationHelper
	# def page_title (page_tilte = '')
	# 	short_title = "Restaurant for Coder"
	# 	if page_title.empty?
	# 		short_title
	# 	else
	# 		page_title + " | " +short_title
	# 	end
	# end

	def active_link(link_text,link_path)
		class_name = current_page?(link_path) ? "active" : ""
		content_tag :li, class: class_name do
			content_tag :a do
				link_to link_text, link_path
			end
		end 
	end
end
