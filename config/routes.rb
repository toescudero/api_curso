Rails.application.routes.draw do
  resources :challenges
  resources :courses
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
