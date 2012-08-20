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
  
  def careers    
  end
  
  def privacy    
  end
  
  def terms    
  end

end
