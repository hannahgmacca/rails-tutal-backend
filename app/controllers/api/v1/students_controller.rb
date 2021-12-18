class Api::V1::StudentsController < ApplicationController
    before_action :set_student, only: %i[ show edit update destroy ]
    # before_action :authenticate_user
      
    def index
        @students = Student.all
        
        render json: @students
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
    @student = Student.new(student_params)

    respond_to do |format|
        if @student.save
        format.html { redirect_to @student, notice: "student was successfully created." }
        format.json { render :show, status: :created, location: @student}
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        end
    end
    end

    def update
    respond_to do |format|
        if @student.update(student_params)
        format.html { redirect_to @student, notice: "student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
        else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        end
    end
    end

    def destroy
    @student.destroy
    respond_to do |format|
        format.html { redirect_to student_url, notice: "student was successfully destroyed." }
        format.json { head :no_content }
    end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
        @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
        params.require(:student).permit(:DOB, :user_info_id)
    end
end
