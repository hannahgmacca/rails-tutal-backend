class Api::V1::RequestsController < ApplicationController
    before_action :set_request, only: %i[ show edit update destroy ]
    before_action :authenticate_user
      
    def index
        @requests = Request.all
        
        render json: @requests
    end

    def show
        render json: @subject
    end

    def new
    end

    def edit
    end

    def create
    @request = Request.new(request_params)

    respond_to do |format|
        if @request.save
        format.html { redirect_to @request, notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
        else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
        end
    end
    end

    def update
    respond_to do |format|
        if @request.update(request_params)
        format.html { redirect_to @request, notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
        else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
        end
    end
    end

    def destroy
    @request.destroy
    respond_to do |format|
        format.html { redirect_to request_url, notice: "Request was successfully destroyed." }
        format.json { head :no_content }
    end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
        @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
        params.require(:request).permit(:student_id, :tutor_id, :is_approved)
    end
end
