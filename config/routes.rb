Rails.application.routes.draw do

	scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
		root to: 'index#home'
		match 'services', to: 'index#services', :via => 'get'
		match 'about', to: 'index#about', :via => 'get'
		match 'contact', to: 'index#contact', :via => 'get'

		devise_for :users
		resources :slides, :except => [:show]
		resources :languages, :except => [:show]
		resources :schedules, :except => [:show]
		resources :industries, :except => [:show]
		resources :employments, :except => [:show]
		resources :language_levels, :except => [:show]
		resources :jobs
		resources :users do
			resources :educations, :except => [:show]
			resources :experiences, :except => [:show]
			resources :skills, :except => [:show]
			resources :user_languages, :except => [:show]
		end
		resources :degrees, :except => [:show]
		resources :applications, :except => [:show]
		resources :values, :except => [:show]
		resources :services, :except => [:show, :index]

		# Message Mailer
		get 'cancel_update_user', to: 'users#cancel_update'
		post 'cancel_update_user', to: 'users#cancel_update'

		# Education custom
		get 'cancel_educations', to: 'educations#cancel'
		post 'cancel_educations', to: 'educations#cancel'

		# Experience custom
		get 'cancel_experiences', to: 'experiences#cancel'
		post 'cancel_experiences', to: 'experiences#cancel'
		
		# Skill custom
		get 'cancel_skills', to: 'skills#cancel'
		post 'cancel_skills', to: 'skills#cancel'

		# User languages custom
		get 'cancel_user_languages', to: 'user_languages#cancel'
		post 'cancel_user_languages', to: 'user_languages#cancel'

		# User languages custom
		get 'profile', to: 'users#profile'
		get 'profile_content', to: 'users#profile_content'
		get 'profile_applications', to: 'users#profile_applications'
		get 'profile_maintenance', to: 'users#profile_maintenance'

		# Services custom
		get 'services_all', to: 'services#index'
		post 'services_all', to: 'services#index'

		# Message Mailer
		post 'contact', to: 'messages#create'

		#Error routes
		match '/404', to: 'errors#file_not_found', via: :all
		match '/422', to: 'errors#unprocessable', via: :all
		match '/500', to: 'errors#internal_server_error', via: :all

		# Invalid routes
		get '*unmatched_route', to: 'errors#file_not_found'

	end
	#get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
	#get '', to: redirect("/#{I18n.default_locale}")
	get '/*locale/*path', to: redirect("/#{I18n.default_locale}/%{path}")
	get '/*path', to: redirect("/#{I18n.default_locale}/%{path}"),
  		constraints: lambda { |req| I18n.available_locales.none? { |locale| req.path.starts_with? locale.to_s } }
  	get '', to: redirect("/#{I18n.default_locale}")
end
