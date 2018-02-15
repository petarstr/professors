Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'user', :skip => [:edit_user_registrations]
  resources :users, only: [:edit, :update]

  resources :cities, only: [:index]

  get 'cities/:id/faculties', to: 'faculties#index'
  get 'faculties/:id/courses', to: 'courses#index'
  get 'courses/:id/subjects', to: 'subjects#index'


  mount_devise_token_auth_for 'Professor', at: 'professor'
  as :professor do
    resources :professors, only: [] do
      collection do
        put '/', to: 'professors#update'
        get 'edit', to: 'professors#edit'
      end
      resources :offers
    end
  end
end
