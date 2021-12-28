class Api::V1::TutorSubjectsController < ApplicationController
    before_action :set_tutor, only: %i[ index ]
    before_action :authenticate_user
          
    # ROUTE /tutor/subjects
    # Returns array of subjects that belong to this tutor
    def index
        @tutor_subjects = TutorSubject.where(tutor_id: @tutor.id)
        
        render json: @tutor_subjects
    end

    def create
    @tutor_subject = TutorSubject.new(tutor_subject_params)

    respond_to do |format|
        if @tutor_subject.save
        format.html { redirect_to @tutor_subject, notice: "tutor_subject was successfully created." }
        format.json { render :show, status: :created, location: @tutor_subject}
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutor_subject.errors, status: :unprocessable_entity }
        end
    end
    end

    def destroy
    @tutor_subject.destroy
    respond_to do |format|
        format.html { redirect_to tutor_subject_url, notice: "tutor_subject was successfully destroyed." }
        format.json { head :no_content }
    end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_subject
        @tutor_subject = TutorSubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_subject_params
        params.require(:tutor_subject).permit(:tutor_id, :subject_id)
    end
end
