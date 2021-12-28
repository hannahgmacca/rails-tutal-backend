class ApplicationController < ActionController::Base
    include Knock::Authenticable
    before_action :authenticate_user, only: %i[ set_student set_tutor]
    skip_before_action :verify_authenticity_token, raise: false

    private 
    def set_tutor
        @user_info = UserInfo.find_by_user_id(current_user.id)
        @tutor = Tutor.find_by_user_info_id(@user_info.id)
    end
  
    def set_student
        @user_info = UserInfo.find_by_user_id(current_user.id)
        @student = Student.find_by_user_info_id(@user_info.id)
    end
end
