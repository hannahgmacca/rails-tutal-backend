Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :users
  root 'home#index'

  # Devise Rails API requires scope, rather than namespace
  # scope :api do
  #   scope :v1 do
  #     devise_for :users
  #   end
  # end

  scope '/auth' do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'users#create'
  end

  # API routes are as '/api/v1/<resource>'
  namespace :api do
    namespace :v1 do
     resources :user_infos
     resources :subjects
     resources :requests
     resources :tutor_subjects
     resources :tutors
     resources :student_subjects
     resources :students
     resources :tutor_students
    end
   end
end
