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
		resources :jobs
		resources :users do
			resources :educations, :except => [:show]
			resources :experiences, :except => [:show]
			resources :skills, :except => [:show]
		end
		resources :degrees, :except => [:show]

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

  	# Message Mailer
  	post 'contact', to: 'messages#create'
	end
	get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
	get '', to: redirect("/#{I18n.default_locale}")
end
