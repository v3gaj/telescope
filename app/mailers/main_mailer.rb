class MainMailer < ApplicationMailer

	include Rails.application.routes.url_helpers

	default from: "info@telescopehr.com"

	def user_profile_incomplete(user)
		mail(to: user.email, subject: 'Incomplete Profile')
	end

end
