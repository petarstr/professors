Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'user'

  get 'cities', to: 'cities#index'

  mount_devise_token_auth_for 'Professor', at: 'professor'
  as :professor do
    # Define routes for Professor within this block.
  end
end
