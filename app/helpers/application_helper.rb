module ApplicationHelper

	def format_currency(country)
		if country.eql?("India")
			"Rs."
		else
			"$"
		end		
	end

	def calc_price(inr_cost,usd_cost,country)
		if country.eql?("India")
			number_with_delimiter(inr_cost)   
		else
			number_with_delimiter(usd_cost)   
		end	
	end
end
