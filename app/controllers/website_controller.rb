class WebsiteController < ApplicationController
  
  def index
    @page_title       = 'Web-based vehicle maintenance and fleet management software'
    @page_description = 'Fleetnext is a fleet software that helps organizations simplify vehicle administration, maintain better vehicles, improve productivity and keep track of fleet costs. '
  end

  def tour
    @page_title       = 'Product tour'
    @page_description = 'See how our web-based fleet software helps improve vehicle record-keeping, reduce paperwork, be proactive about preventive maintenance and ensure compliance.'
  end

  def features
    @page_title       = 'Product features'
    @page_description = 'Our web-based fleet software helps manage vehicle document renewals, preventive maintenance scheduling, service workorders, fuel log, meter readings, tyres, driver licenses'
  end

  def pricing
    @page_title       = 'Pricing'
    @page_description = 'See pricing and payment details for our web-based fleet software.'

    @country = get_country_info()
  end

  def why_fleetnext
    @page_title       = 'Advantages'
    @page_description = 'See why our web-based fleet software is secure, quicker to implement backed by great support'  
  end

  def faq
    @page_title       = 'FAQ'
    @page_description = 'Frequently asked questions about our web-based fleet software.'  
  end

  def contact
    @page_title       = 'Contact information'
    @page_description = 'Company address, email information. Use the feedback form to contact us.'   

    @message = Message.new    
  end
  
  def contact_process
    @page_title       = 'Contact information'
    @page_description = 'Company address, email information. Use the feedback form to contact us.'

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
    @page_title       = 'About'
    @page_description = 'Know more about our web-based software and the company.'
  end
  
  def privacy   
    @page_title       = 'Security and privacy policy'
    @page_description = 'Security and privacy policy for our web-based fleet software.'   
  end
  
  def terms   
    @page_title       = 'Terms of use'
    @page_description = 'Terms of use for our web-based fleet software.' 
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
