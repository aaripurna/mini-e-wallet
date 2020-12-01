Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  delete 'auth/logout', to: 'authentication#logout'
  post 'signup', to: 'users#create'

  resource :balances, only: [] do
    collection do
      get '/', to: 'balances#index'
      post :topup
      post :transfer
    end
  end
end
