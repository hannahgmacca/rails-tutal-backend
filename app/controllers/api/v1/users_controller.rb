module Api
    module V1
        class UsersController < ApplicationController
            def create
                @user = User.create(user_params)
                if @user.save
                    auth_token = Knock::AuthToken.new payload: {sub: @user.id}
                    render json: {username: @user.username, jwt: auth_token.token}, status: :created
                else
                    render json: @user.errors, status: :unprocessable_entity
                end 
            end 

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
                            render json: {username: @user.username, jwt: auth_token.token, student: @student }, status: :created
                        else
                            render json: @student.errors, status: :unprocessable_entity
                            @user.destroy
                            @user_info.destroy
                            @student.destroy
                        end 
                    else
                        render json: @user_info.errors, status: :unprocessable_entity
                    end
                else
                    render json: @user.errors, status: :unprocessable_entity
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
                            render json: {username: @user.username, jwt: auth_token.token, tutor: @tutor, created: "created"}, status: :created
                        else
                            render json: @tutor.errors, status: :unprocessable_entity
                            @user.destroy
                            @user_info.destroy
                            @tutor.destroy
                        end 
                    else
                        render json: @user_info.errors, status: :unprocessable_entity
                    end
                    else
                    render json: @user.errors, status: :unprocessable_entity
                    end
            end


            def sign_in 
                @user = User.find_by_email(params[:email])
                if @user && @user.authenticate(params[:password])
                    auth_token = Knock::AuthToken.new payload: {sub: @user.id}
                    render json: {username: @user.username, jwt: auth_token.token}, status: 200
                else
                    render json: {error: "Incorrect Username or Password"}, status: 404 

                end 
            end 

            def index
                @users = User.all

                render json: @users
            end

            private 
            def user_params 
                params.permit(:username, :email, :password, :password_confirmation)
            end 

            def tutor_params
                params.permit(:credentials => [:username, :email, :password, :password_confirmation], :user_info => [:first_name, :last_name, :about, :suburb], :tutor => [:years_experience, :rating, :rate])
            end

            def student_params
                params.permit(:credentials => [:username, :email, :password, :password_confirmation], :user_info => [:first_name, :last_name, :about, :suburb], :student => [:DOB])
            end
        end
    end 
end