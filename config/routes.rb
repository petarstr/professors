Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'user'

  resources :cities, only: [:index]

  get 'cities/:id/faculties', to: 'faculties#index'
  get 'faculties/:id/courses', to: 'courses#index'
  get 'courses/:id/subjects', to: 'subjects#index'


  mount_devise_token_auth_for 'Professor', at: 'professor'
  as :professor do
    # Define routes for Professor within this block.
  end
end
