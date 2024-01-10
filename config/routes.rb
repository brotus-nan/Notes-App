Rails.application.routes.draw do

  get 'notes/index'
  get "up" => "rails/health#show", as: :rails_health_check
end
