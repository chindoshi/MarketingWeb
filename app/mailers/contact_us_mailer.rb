class ContactUsMailer < ActionMailer::Base
  default :from => "noreply@fleetnext.com"
  default :to => "info@fleetnext.com"

  def new_message(message)
    @message = message
    mail(:subject => "[fleetnext.com] inquiry")
  end

end
