Rails.application.routes.draw do
  resources :tests
  root 'home#index'

  # API routes are as '/api/v1/<resource>'
  namespace :api do
    namespace :v1 do
     #TODO only add routes that are in use
     resources :user_infos
     resources :subjects
     resources :requests
     resources :tutor_subjects
     resources :tutors
     resources :student_subjects
     resources :students
     resources :tutor_students
     resources :users

     # AUTH ROUTES
     scope '/auth' do
      post 'user_token' => 'user_token#create'
      post '/signin', to: 'user_token#create'
      post '/signup', to: 'users#create'
      post '/signup/tutor', to: 'users#create_tutor'
      post '/signup/student', to: 'users#create_student'
     end
    end
   end
end
