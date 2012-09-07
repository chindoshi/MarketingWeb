class WebsiteController < ApplicationController
  
  def index
  end

  def tour
  end

  def pricing
  end

  def why_fleetnext
  end

  def faq
  end

  def contact
     @message = Message.new
  end
  
  def contact_process
    @message = Message.new(params[:message])
    
    if @message.valid?
      ContactUsMailer.new_message(@message).deliver
      redirect_to(website_contact_path, :notice => "Your message was sent.")
    else
      flash.now.notice = "Please fill all fields."
      render "contact"
    end     
  end
  
  def about    
  end
  
  def privacy    
  end
  
  def terms    
  end
  
  def subscribe
    api = Mailchimp::API.new('48af77f3a52ab88961398127e55921ef-us5')
    list_id = api.lists["data"][0]["id"]
    response = api.listSubscribe({:id => list_id, :email_address => params[:email]})
    
    if response.is_a?(Hash)
      redirect_to website_contact_path, :flash => {:notice => "Sorry, unable to unsubscribe you"}       
    else
       redirect_to website_contact_path, :flash => {:notice => "You have been successfully subscribed"} 
    end
    
  end

end
