class Api::V1::TutorStudentsController < ApplicationController
    before_action :set_tutor_student, only: %i[ show edit update destroy ]
    before_action :authenticate_user
      
    def index
        @tutor_students = TutorStudent.all
        
        render json: @tutor_students
    end

    def show
        render json: tutor_student_params[:tutor_student_id]
    end

    def new
    end

    def edit
    end

    def create
    @tutor_student = TutorStudent.new(tutor_student_params)

    respond_to do |format|
        if @tutor_student.save
        format.html { redirect_to @tutor_student, notice: "tutor_student was successfully created." }
        format.json { render :show, status: :created, location: @tutor_student}
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutor_student.errors, status: :unprocessable_entity }
        end
    end
    end

    def update
    respond_to do |format|
        if @tutor_student.update(tutor_student_params)
        format.html { redirect_to @tutor_student, notice: "tutor_student was successfully updated." }
        format.json { render :show, status: :ok, location: @tutor_student }
        else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutor_student.errors, status: :unprocessable_entity }
        end
    end
    end

    def destroy
    @tutor_student.destroy
    respond_to do |format|
        format.html { redirect_to tutor_student_url, notice: "tutor student was successfully destroyed." }
        format.json { head :no_content }
    end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_student
        @tutor_student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_student_params
        params.require(:tutor_student).permit(:student_id, :tutor_id)
    end
end
