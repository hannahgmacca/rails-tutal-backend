class Api::V1::StudentSubjectsController < ApplicationController
    before_action :set_student_subject, only: %i[ show edit update destroy ]
      
    def index
        @student_subjects = Student.all
        
        render json: @student_subjects
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
    @student_subject = StudentSubject.new(student_subject_params)

    respond_to do |format|
        if @student_subject.save
        format.html { redirect_to @student_subject, notice: "student_subject was successfully created." }
        format.json { render :show, status: :created, location: @student_subject }
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_subject.errors, status: :unprocessable_entity }
        end
    end
    end

    def update
    respond_to do |format|
        if @student_subject.update(student_subject_params)
        format.html { redirect_to @student_subject, notice: "student_subject was successfully updated." }
        format.json { render :show, status: :ok, location: @student_subject }
        else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_subject.errors, status: :unprocessable_entity }
        end
    end
    end

    def destroy
    @student_subject.destroy
    respond_to do |format|
        format.html { redirect_to student_subject_url, notice: "student_subject was successfully destroyed." }
        format.json { head :no_content }
    end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_subject
        @student_subject = StudentSubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_subject_params
        params.require(:student_subject).permit(:title)
    end
end
