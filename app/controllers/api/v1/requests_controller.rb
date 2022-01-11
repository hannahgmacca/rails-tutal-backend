class Api::V1::RequestsController < ApplicationController
    before_action :set_request, only: %i[ show edit update destroy approve decline ]
    before_action :set_student, only: %i[ my_requests_student destroy create]
    before_action :set_tutor, only: %i[ my_requests_tutor approve decline ]
    # before_action :authenticate_user

    # ROUTE GET /requests
    # Returns all requests for debugging
    def index
        @requests = Request.all

        render json: @requests
    end
      
    # ROUTE /student/requests
    # Returns array of requests that have been sent by current student
    def my_requests_student
        @requests = Request.where(student_id: @student.id)
        
        render json: @requests
    end

    # ROUTE /tutor/requests
    # Returns array of requests that are awaiting action for current tutor
    def my_requests_tutor
        @requests = Request.where(:tutor_id => @tutor.id, :is_approved => nil)
        
        render json: @requests
    end

    # ROUTE /request/:id/approve
    def approve
        if @tutor.id == @request.tutor_id
            @request.is_approved = true 
            @tutor_student = TutorStudent.create(tutor_id: @tutor.id, student_id: @request.student_id)
            if @request.save && @tutor_student.save
                render json: {is_approved: true, tutor_student: @tutor_student}, status: 200
            end
        else
            render json: {error: "You are not authorised to approved this"}, status: 400
        end
    end

    # ROUTE /request/:id/decline
    def decline
        if @tutor.id == @request.tutor_id
            @request.is_approved = false
            if @request.save
                render json: {approved: false, request: @request}, status: 200
            end
        else
            render json: {error: "You are not authorised to approved this"}, status: 400
        end
    end

    def create
    already_exists = Request.find_by_tutor_id_and_student_id(request_params[:tutor_id], @student.id)
    if already_exists
        render json: { error: "Request has already been made" }, status: 400
    else
    @request = Request.new(request_params)
    @request.student_id = @student.id
        if @request.save
            render json: { request: @request }, status: 200
        else
            render json: { error: @request.errors, student: @student.id }, status: 404
        end
    end
    end

    # ROUTE delete /request/:id
    def destroy
        if @student.id == @request.student_id
            @request.destroy
        else
            render json: { error: "You do not have permission to do this" }, status: 404
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
        @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
        params.permit(:request, :tutor_id, :tutor_id, :is_approved)
    end
end
