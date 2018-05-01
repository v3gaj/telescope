Rails.application.routes.draw do
  
	scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
		root to: 'index#home'
		match 'services', to: 'index#services', :via => 'get'
		match 'about', to: 'index#about', :via => 'get'
		match 'contact', to: 'index#contact', :via => 'get'

		devise_for :users
  		resources :slides, :except => [:show]

  		# Message Mailer
  		post 'contact', to: 'messages#create'
	end
	get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
	get '', to: redirect("/#{I18n.default_locale}")
end
