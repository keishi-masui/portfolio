Rails.application.routes.draw do


  root "home#index"
  resources :home, only: [:index] do
    collection do
      get 'profile'
      get 'blog'
      get 'contact'
    end
  end

  resources :product


end

