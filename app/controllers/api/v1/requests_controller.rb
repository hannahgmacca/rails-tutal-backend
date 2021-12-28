class Api::V1::RequestsController < ApplicationController
    # before_action :set_request, only: %i[ show edit update destroy ]
    before_action :set_student, only: %i[ my_requests_student ]
    before_action :set_tutor, only: %i[ my_requests_tutor approve decline ]
    before_action :authenticate_user
      
    # ROUTE /student/requests
    # Returns array of requests that have been sent by current student
    def my_requests_student
        @requests = Request.where(student_id: @student.id)
        
        render json: @requests
    end

    # ROUTE /tutor/requests
    # Returns array of requests that are awaiting action for current tutor
    def my_requests_tutor
        @requests = Request.where(tutor_id: @tutor.id, is_approved: null)
        
        render json: @requests
    end

    # ROUTE /request/:id/approve
    def approve
    end

    # ROUTE /request/:id/decline
    def decline
    end

    def create
    # TODO: Add logic to catch if a request has already been made
    @request = Request.new(request_params)
        if @request.save
            render json: { request: @request }, status: 200
        else
            render json: { error: @request.errors }, status: 404
        end
    end

    def destroy
    # TODO: Add logic to catch if request was sent by this student
        @request.destroy
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
