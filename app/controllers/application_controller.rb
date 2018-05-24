class ApplicationController < ActionController::Base
	
	# GLOBALIZE internationalization

	protect_from_forgery
	before_action :set_locale

	# DEVISE Redirect back after sign in

	before_action :store_user_location!, if: :storable_location?

	def require_user
    if !current_user
      flash[:danger] = "Para realizar esta acción se requiere iniciar sesión."
      redirect_to new_user_session_path
    end
  end

  def require_admin
    if !current_user.admin?
      flash[:danger] = "Solo los usuarios administradores pueden realizar esa acción."
      redirect_to root_path
    end
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "Solo puedes editar tu propia cuenta."
      redirect_back fallback_location: root_path
    end
  end

  def admin_not_allowed
    if @user.admin?
      flash[:danger] = "Los administradores no pueden realizar esta tarea."
      redirect_back fallback_location: root_path
    end
  end

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
