require 'digest/sha2'  

class MessageMailer < ApplicationMailer

	default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@telescopehr.com"

	default from: "Your Mailer <webcontact@telescopehr.com>"
	default to: "Your Name <info@telescopehr.com>"

	def new_message(message)
    @message = message
  
  	mail subject: "Message from #{message.name}"
	end

end
