class MessageMailer < ApplicationMailer

	default from: "Your Mailer <webcontact@telescopehr.com>"
  	default to: "Your Name <info@telescopehr.com>"

  	def new_message(message)
	    @message = message
    
    	mail subject: "Message from #{message.name}"
  	end

end
