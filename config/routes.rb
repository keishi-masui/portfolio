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

end

