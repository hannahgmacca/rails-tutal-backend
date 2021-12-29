class Api::V1::TutorsController < ApplicationController
    # before_action :set_tutor_profile, only: %i[ show edit update destroy ]
    before_action :set_student, only: %i[ my_tutors ]
    before_action :authenticate_user, only: %i[ my_tutors ]

    def index
        @tutors = Tutor.where(nil)
        @tutors = @tutors.filter_by_postcode(params[:postcode]) if params[:postcode].present?
        @tutors = @tutors.filter_by_experience(params[:years_experience]) if params[:years_experience].present?
        @tutors = @tutors.filter_by_subjects(params[:subjects]) if params[:subjects].present?
        @tutors = @tutors.filter_by_rate(params[:rate]) if params[:rate].present?
        @tutors = @tutors.filter_by_(params[:online]) if params[:online].present?

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

    # def update
    # respond_to do |format|
    #     if @tutor.update(tutor_params)
    #     format.html { redirect_to @tutor_subject, notice: "tutor was successfully updated." }
    #     format.json { render :show, status: :ok, location: @tutor }
    #     else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @tutor.errors, status: :unprocessable_entity }
    #     end
    # end
    # end

    # def destroy
    # @tutor.destroy
    # respond_to do |format|
    #     format.html { redirect_to tutor_url, notice: "tutor was successfully destroyed." }
    #     format.json { head :no_content }
    # end
    # end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_profile
        @tutor = Tutor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_params
        params.require(:tutor).permit(:years_experience, :rating, :user_info_id, :is_online)
    end
end
