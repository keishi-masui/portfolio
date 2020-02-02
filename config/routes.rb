Rails.application.routes.draw do

# ホーム画面
  root "home#index"
  resources :home, only: [:index] do
    collection do
      get 'profile'
      get 'blog'
    end
  end

# 商品詳細画面
  resources :product

# お問い合わせ
  resources :contacts, only: [:new, :create] do
    collection do
      post 'confirm'
    end
  end

# 管理人ログイン機能
  get '/users/:id', to: 'users#show'

  get 'sessions/login', to: 'sessions#new'
  post 'sessions/login', to: 'sessions#create'
  delete 'sessions/logout', to: 'sessions#destroy'

end

