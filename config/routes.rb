Rails.application.routes.draw do
  resources :notes do
    member do
      put :archive, :delete
    end
  end

end
