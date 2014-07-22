module ApplicationHelper
	def get_title title
		base_title = "Edde's Sample App"
		if title.blank?
			base_title
		else
			base_title + " | " + title
		end
	end
end
