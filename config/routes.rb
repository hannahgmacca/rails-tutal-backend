Rails.application.routes.draw do
  root 'home#index'
# Rails API handles controller
  namespace :api do
    namespace :v1 do
      resources :subjects
      devise_for :users
    end
  end
end
