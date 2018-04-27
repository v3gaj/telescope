Rails.application.routes.draw do

	scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
		root to: 'index#home'
		match 'services', to: 'index#services', :via => 'get'
		match 'about', to: 'index#about', :via => 'get'
		match 'contact', to: 'index#contact', :via => 'get'
	end
	get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
	get '', to: redirect("/#{I18n.default_locale}")
end
