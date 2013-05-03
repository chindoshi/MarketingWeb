module ApplicationHelper

	def format_currency(country)
		if country.eql?("India") or country.blank?
			"Rs."
		else
			"$"
		end		
	end

	def calc_price(cost,country)
		if country.eql?("India") or country.blank?
			number_with_delimiter(cost)   
		else
			number_with_delimiter(cost/50)   
		end	
	end
end
