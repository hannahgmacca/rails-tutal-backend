class Api::V1::TutorsController < ApplicationController
    before_action :set_tutor, only: %i[ show edit update destroy ]
      
    def index
   
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
    @tutor = Tutor.new(tutor_params)

    respond_to do |format|
        if @tutor.save
        format.html { redirect_to @tutor, notice: "tutor was successfully created." }
        format.json { render :show, status: :created, location: @tutor}
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
        end
    end
    end

    def update
    respond_to do |format|
        if @tutor.update(tutor_params)
        format.html { redirect_to @tutor_subject, notice: "tutor was successfully updated." }
        format.json { render :show, status: :ok, location: @tutor }
        else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
        end
    end
    end

    def destroy
    @tutor.destroy
    respond_to do |format|
        format.html { redirect_to tutor_url, notice: "tutor was successfully destroyed." }
        format.json { head :no_content }
    end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor
        @tutor = Tutor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutor_params
        params.require(:tutor).permit(:title)
    end
end
