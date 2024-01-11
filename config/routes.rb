Rails.application.routes.draw do
  get 'static_pages/home'
  resources :notes do
    member do
      put :archive, :delete
    end
  end

  # Authentication
  root "notes#index"
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
end
