module Api
    module V1
        class UsersController < ApplicationController
            before_action :authenticate_user, only: %i[ get_current index ]
            before_action :set_user_info, only: %i[ update ]
            skip_before_action :verify_authenticity_token, raise: false

            # TODO: Maybe move this to student controller
            def create_student
                @user = User.create(student_params[:credentials])
                if @user.save
                    @user_info = UserInfo.create(student_params[:user_info])
                    @user_info.user_id = @user.id
                    if @user_info.save
                        @student = Student.create(student_params[:student])
                        @student.user_info_id = @user_info.id
                        if @student.save
                            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
                            render json: {jwt: auth_token.token, student: @student}, status: :created
                        else
                            render json: { errors: @student.errors }, status: :unprocessable_entity
                            @user.destroy
                            @user_info.destroy
                            @student.destroy
                        end 
                    else
                        render json: { error: @user_info.errors }, status: :unprocessable_entity 
                        @user.destroy
                    end
                else
                    render json: { errors:  @user.errors }, status: :unprocessable_entity
                end
            end

            
            def create_tutor
                @user = User.create(tutor_params[:credentials])
                if @user.save
                @user_info = UserInfo.create(tutor_params[:user_info])
                @user_info.user_id = @user.id
                if @user_info.save
                    @tutor = Tutor.create(tutor_params[:tutor])
                    @tutor.user_info_id = @user_info.id
                        if @tutor.save
                            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
                            render json: {jwt: auth_token.token, tutor: @tutor}, status: :created
                        else
                            render json: { errors: @tutor.errors }, status: :unprocessable_entity
                            @user.destroy
                            @user_info.destroy
                        end 
                else
                    render json: { error: @user_info.errors }, status: :unprocessable_entity 
                    @user.destroy
                end
                else
                render json: { errors:  @user.errors }, status: :unprocessable_entity
                end
            end


            def sign_in 
                @user = User.find_by_email(params[:email])
                if @user && @user.authenticate(params[:password])
                    auth_token = Knock::AuthToken.new payload: {sub: @user.id}
                    render json: {jwt: auth_token.token, user: @user}, status: 200
                else
                    render json: {error: "Incorrect Username or Password"}, status: 404 

                end 
            end 

            # GET: /me 
            # Returns details about current user e.g name and if they are a tutor / student
            def get_current
                user_info = UserInfo.find_by_user_id(current_user.id)
                tutor = Tutor.find_by_user_info_id(user_info.id)
                student = Student.find_by_user_info_id(user_info.id)
                if tutor 
                # render json: { credentials: current_user, is_tutor: true, firstname: user_info.first_name}
                render json: { user_id: current_user.id, tutor_id: tutor.id, is_tutor: true, firstname: user_info.first_name, lastname: user_info.last_name, about: user_info.about, postcode: user_info.postcode, tutor_info: tutor, email: current_user.email }
                elsif student
                render json: { user_id: current_user.id, student_id: student.id, is_tutor: false, firstname: user_info.first_name, lastname: user_info.last_name, about: user_info.about, postcode: user_info.postcode, student_info: student, email: current_user.email }
                else 
                render json: { error: user_info.errors }, status: 404
                end
            end

            def index
                @users = User.all

                render json: @users
            end

            def update
            @user = User.find(current_user.id)
             if @user.update(user_params[:user]) && @user_info.update(user_params[:user_info]) 
                    render json: {user: current_user, user_info: @user_info}, status: 200
             end
            end

            private 
            def user_params 
                params.permit(:user => [:email, :password, :password_confirmation], :user_info => [ :about, :first_name, :last_name, :main_image])
            end 

            def image_params 
                params.permit(:image => [:main_image])

            end

            def tutor_params
                params.permit(:credentials => [:username, :email, :password, :password_confirmation], :user_info => [:first_name, :last_name, :about, :postcode, :main_image], :tutor => [:years_experience, :rating, :rate, :online, :rate])
            end

            def student_params
                params.permit(:credentials => [:email, :password, :password_confirmation], :user_info => [:first_name, :last_name, :about, :postcode, :main_image, :user_id], :student => [:DOB])
            end
        end
    end
end
