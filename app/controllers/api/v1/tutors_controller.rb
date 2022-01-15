class Api::V1::TutorsController < ApplicationController
    before_action :set_student, only: %i[ my_tutors ]
    before_action :set_tutor, only: %i[ update ]
    before_action :set_url_tutor, only: %i[ show ]

    def index
        @tutors = Tutor.where(nil)
        @tutors = @tutors.filter_by_postcode(params[:postcode]) if params[:postcode].present?
        @tutors = @tutors.filter_by_experience(params[:years_experience]) if params[:years_experience].present?
        @tutors = @tutors.filter_by_subject(params[:subject]) if params[:subject].present?
        @tutors = @tutors.filter_by_rate(params[:rate]) if params[:rate].present?
        @tutors = @tutors.filter_by_online if params[:online] == 'true'

        render json: @tutors
    end 
    
    def show
        render json: @tutor
    end

    def update
        if @tutor.update(tutor_params)
            render json: { user_id: current_user.id, tutor_id: @tutor.id, is_tutor: true, firstname: @tutor.user_info.first_name, lastname: @tutor.user_info.last_name, about: @tutor.user_info.about, postcode: @tutor.user_info.postcode, tutor_info: @tutor, email: current_user.email }
        else
            render json: {error: @tutor.errors}, status: :unprocessable_entity
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_url_tutor
        @tutor = Tutor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_params
        params.require(:tutor).permit(:user, :years_experience, :rating, :user_info_id, :online, :rate, :onboarding)
    end
end
