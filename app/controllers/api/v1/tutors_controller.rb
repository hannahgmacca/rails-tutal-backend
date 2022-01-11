class Api::V1::TutorsController < ApplicationController
    # before_action :set_tutor_profile, only: %i[ show edit update destroy ]
    before_action :set_student, only: %i[ my_tutors ]
    before_action :set_tutor, only: %i[ update ]
    # before_action :authenticate_user, only: %i[ my_tutors update ]

    def index
        @tutors = Tutor.where(nil)
        @tutors = @tutors.filter_by_postcode(params[:postcode]) if params[:postcode].present?
        @tutors = @tutors.filter_by_experience(params[:years_experience]) if params[:years_experience].present?
        @tutors = @tutors.filter_by_subject(params[:subject]) if params[:subject].present?
        @tutors = @tutors.filter_by_rate(params[:rate]) if params[:rate].present?
        @tutors = @tutors.filter_by_online if params[:online] == 'true'

        render json: @tutors
    end 
    
    # def show
    # end

    # def new
    # end

    # def edit
    # end

    # def create
    # @tutor = Tutor.new(tutor_params)

    # respond_to do |format|
    #     if @tutor.save
    #     format.html { redirect_to @tutor, notice: "tutor was successfully created." }
    #     format.json { render :show, status: :created, location: @tutor}
    #     else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @tutor.errors, status: :unprocessable_entity }
    #     end
    # end
    # end

    def update
        if @tutor.update(tutor_params)
            render json: {tutor: @tutor}, status: 200
        else
            render json: {error: @tutor.errors}, status: :unprocessable_entity
        end
    end

    # def destroy
    # @tutor.destroy
    # respond_to do |format|
    #     format.html { redirect_to tutor_url, notice: "tutor was successfully destroyed." }
    #     format.json { head :no_content }
    # end
    # end

    private
    # Use callbacks to share common setup or constraints between actions.
    # def set_tutor
    #     @tutor = Tutor.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def tutor_params
        params.require(:tutor).permit(:user, :years_experience, :rating, :user_info_id, :online, :rate, :onboarding)
    end
end
