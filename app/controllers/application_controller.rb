class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :get_country_info

  def get_country_info
  	 request.location.country rescue "nil"
  end

end
