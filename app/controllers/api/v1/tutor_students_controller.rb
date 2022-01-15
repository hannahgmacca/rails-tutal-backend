class Api::V1::TutorStudentsController < ApplicationController
    before_action :set_student, only: %i[ my_tutors remove_tutor ]
    before_action :set_tutor, only: %i[ my_students remove_student  ]
    before_action :set_tutor_student, only: %i[ remove_tutor remove_student]
    
    #  ROUTE GET: /student/tutors
    #  Returns array of tutors that are tutoring this student
    def my_tutors
        @tutors = TutorStudent.where(student_id: @student.id)

        render json: @tutors
    end

    #  ROUTE GET: /tutor/students
    #  Returns array of students that current tutor is tutoring
    def my_students
        @students = TutorStudent.where(tutor_id: @tutor.id)

        render json: @students
    end

    # ROUTE DELETE: /student/tutor/:id
    # Deletes the tutor relationship associated with current student
    def remove_tutor
        if @tutor_student.student_id == @student.id
            @tutor_student.destroy
            render json: { success: "Deleted" }, status: 204
        else 
            render json: { error: "You do not have permission to do this" }, status: 404
        end
    end

    # ROUTE DELETE: /tutor/student/:id
    # Deletes the student relationship associated with current tutor
    def remove_student
        if @tutor_student.tutor_id == @tutor.id
            @tutor_student.destroy
            render json: { success: "Deleted" }, status: 204
        else
            render json: { error: "You do not have permission to do this" }, status: 404
        end
    end

    def create
        @tutor_student = TutorStudent.new(tutor_student_params)
        
        if @tutor_student.save
            render json: { tutor_student: @tutor_student }, status: :created
        else
            render json: {errors: @tutor_student.errors}, status: :unprocessable_entity
        end
    end

    def add_review
        @tutor_student = TutorStudent.find_by_tutor_id_and_student_id(tutor_student_params[:tutor_id], @student.id)
        @tutor = Tutor.find(tutor_student_params[:tutor_id])
        @tutor_student.review = tutor_student_params[:review]
        @tutor_student.rating = tutor_student_params[:rating]
        @tutor.ratings_left += 1
        @tutor.ratings_sum += tutor_student_params[:rating]
        @tutor.rating = @tutor.ratings_sum / @tutor.ratings_left

        if @tutor_student.save && @tutor.save
            render json: { tutor_student: @tutor_student, tutor_rating: @tutor.rating }, status: :created
        else
            render json: {errors: @tutor_student.errors}, status: :unprocessable_entity
        end
    end

    def get_reviews
        @reviews = TutorStudent.where(tutor_id: @tutor.id)

        render json: @reviews
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_student
        @tutor_student = TutorStudent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_student_params
        params.permit(:student_id, :tutor_id, :review, :rating)
    end
end
