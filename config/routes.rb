Rails.application.routes.draw do

	resources :catpics

	match '*unmatched_route', to: 'application#routing_error', via: :all

end
