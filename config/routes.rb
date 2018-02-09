Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'user'

  mount_devise_token_auth_for 'Professor', at: 'professor'
  as :professor do
    # Define routes for Professor within this block.
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
