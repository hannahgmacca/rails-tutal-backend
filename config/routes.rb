Rails.application.routes.draw do
  root 'home#index'

  # API routes are as '/api/v1/<resource>'
  namespace :api do
    namespace :v1 do

     ## TUTOR SEARCH ##
     get '/tutors', to: 'tutors#index'

     ## REQUESTS ##
     get '/requests', to: 'requests#index'
     post '/requests', to: 'requests#create'
     post '/request/:id/approve', to: 'requests#approve'
     post '/request/:id/decline', to: 'requests#decline'
     delete '/request/:id', to: 'requests#destroy'
     get '/tutor/requests', to: 'requests#my_requests_tutor'
     get '/student/requests', to: 'requests#my_requests_student'

     ## SUBJECTS ##
    #  get '/student/subjects', to: 'student_subjects#index'
     get '/tutor/subjects', to: 'tutor_subjects#index'
     get '/tutor/subjects/:id', to: 'tutor_subjects#tutor_index'
     get '/subjects', to: 'subjects#index'
     post 'student/subjects', to: 'student_subjects#create'
     post 'tutor/subjects', to: 'tutor_subjects#create'
     delete '/tutor/subject/:id', to: 'tutor_subjects#destroy'
     delete '/student/subject/:id', to: 'student_subjects#destroy'


     ## TUTORS ## 
     get '/student/tutors', to: 'tutor_students#my_tutors'
     delete '/student/tutor/:id', to: 'tutor_students#remove_tutor'
     post 'student/tutor', to: 'tutor_students#create'

     post 'tutor/me', to: 'tutors#update'

     ## STUDENTS ## 
     get '/tutor/students', to: 'tutor_students#my_students'
     delete '/tutor/student/:id', to: 'tutor_students#remove_student'
     get '/students', to: 'students#index'

     ## CURRENT USER ## 
     get '/me', to: 'users#get_current'
     post '/me', to: 'users#update'

     ## RATING ##
     post 'student/review', to: 'tutor_students#add_review'

     post 'user_token' => 'user_token#create'

     ### AUTHORIZATION ###
     scope '/auth' do
      post '/signin', to: 'user_token#create'
      post '/signup', to: 'users#create'
      post '/signup/tutor', to: 'users#create_tutor'
      post '/signup/student', to: 'users#create_student'
     end
    end
   end
end
