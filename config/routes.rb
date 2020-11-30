Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  delete 'auth/logout', to: 'authentication#logout'
  post 'signup', to: 'users#create'

  resource :balances do
    collection do
      post :topup
    end
  end
end
