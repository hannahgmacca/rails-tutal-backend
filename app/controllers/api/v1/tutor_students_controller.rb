class Api::V1::TutorStudentsController < ApplicationController
    # before_action :set_tutor_student, only: %i[ show edit update destroy ]
    before_action :set_student, only: %i[ my_tutors remove_tutor]
    before_action :set_tutor, only: %i[ my_students remove_student]
    # before_action :authenticate_user
    
    #  ROUTE GET: /student/tutors
    #  Returns array of tutors that are tutoring this student
    def my_tutors
        @tutors = TutorStudent.where(student_id: @student.id)

        render json: @tutors
    end

    #  ROUTE GET: /tutor/students
    #  Returns array of students that current tutor is tutoring
    def my_students
        @tutors = TutorStudent.where(tutor_id: @tutor.id)
    end

    # ROUTE DELETE: /student/tutor/:id
    # Deletes the tutor relationship associated with current student
    def remove_tutor
        #TODO
    end

    # ROUTE DELETE: /tutor/student/:id
    # Deletes the student relationship associated with current tutor
    def remove_student
        #TODO
    end

    def create
        @tutor_student = TutorStudent.new(tutor_student_params)
        
        if @tutor_student.save
            render json: { tutor_student: @tutor_student }, status: :created
        else
            render json: {errors: @tutor_student.errors}, status: :unprocessable_entity
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_student
        @tutor_student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_student_params
        params.require(:tutor_student).permit(:student_id, :tutor_id, :review)
    end
end
