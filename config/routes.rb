# frozen_string_literal: true

Rails.application.routes.draw do
  resources :ranks_challenges, only: [:index]
  resources :ranks_courses, only: [:index]
  resources :challenges
  resources :courses
  resources :people
  post :signup, path: 'alta/curso/:course_id', to: 'signup#signup_course' ## +?person_id
  post :signup, path: 'alta/reto/:challenge_id', to: 'signup#signup_challenge' ## + ?person_id
  put :signup, path: 'entrega/curso/:course_id', to: 'signup#update_course' ## +?person_id
  put :signup, path: 'entrega/reto/:challenge_id', to: 'signup#update_challenge' ## +?person_id
  delete :signup, path: 'baja/curso/:course_id', to: 'signup#dismiss_course' ## +?person_id
  delete :signup, path: 'baja/reto/:challenge_id', to: 'signup#dismiss_challenge' ## +?person_id

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
