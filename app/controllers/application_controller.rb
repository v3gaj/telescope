class ApplicationController < ActionController::Base
	
	# GLOBALIZE internationalization

	protect_from_forgery
	before_action :set_locale

	# DEVISE Redirect back after sign in

	before_action :store_user_location!, if: :storable_location?

private

	# GLOBALIZE internationalization
	
	def set_locale
		I18n.locale = params[:locale] if params[:locale].present?
	end

	def default_url_options(options = {})
		{locale: I18n.locale}
	end

	# DEVISE Redirect back after sign in

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

protected

	# DEVISE Redirect back after sign in

  def after_sign_in_path_for(resource)
    stored_location_for(:user) || super
  end

end
