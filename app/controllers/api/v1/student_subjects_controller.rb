class Api::V1::StudentSubjectsController < ApplicationController
    before_action :set_student_subject, only: %i[ destroy ]
    before_action :set_student_subject, only: %i[ index ]
    before_action :authenticate_user
      
    # ROUTE /student/subjects
    # Returns array of subjects that belong to this student
    def index
        @student_subjects = StudentSubject.where(student_id: @student.id)
        
        render json: @student_subjects
    end

    def create
    # TODO: Add check to make sure student doesn't already have this subject
    @student_subject = StudentSubject.new(student_subject_params)
    if @student_subject.save
        render json:  { status: :created }
    else
        render json:  { error: @student_subject.erros }
    end
    end

    def destroy
    # TODO: Add logic to catch if subject belongs to this student
    @student_subject.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_subject
        @student_subject = StudentSubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_subject_params
        params.require(:student_subject).permit(:student_id, :subject_id)
    end
end
