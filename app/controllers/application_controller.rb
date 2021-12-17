class ApplicationController < ActionController::API
    include Knock::Authenticable

    private
    # def unauthorized_entity
    #     # format.json { render json: @request.errors, status: :unprocessable_entity }
    #     render json: {:error => "You are not authorized to perform this action"}, :status => :unauthorized
    # end

    # private
    # def authenticate_user
    #     authenticate_for V1::User
    # end
end
