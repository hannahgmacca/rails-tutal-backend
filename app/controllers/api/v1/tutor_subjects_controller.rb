class Api::V1::TutorSubjectsController < ApplicationController
    before_action :set_tutor, only: %i[ create index destroy ]
    before_action :set_tutor_subject, only: %i[ destroy ]

          
    # ROUTE /tutor/subjects
    # Returns array of subjects that belong to this tutor
    def index
        @tutor_subjects = TutorSubject.where(tutor_id: @tutor.id)
        
        render json: @tutor_subjects
    end

    def tutor_index
            @tutor_subjects = TutorSubject.where(tutor_id: params[:id] )
            
            render json: @tutor_subjects
    end

    def create
    already_exists = TutorSubject.find_by_tutor_id_and_subject_id(@tutor.id, tutor_subject_params[:subject_id])
    if already_exists
        render json: { error: "You've already added this subject" }, status: 401
    else
    @tutor_subject = TutorSubject.create(tutor_id: @tutor.id, subject_id: tutor_subject_params[:subject_id])

        if @tutor_subject.save
        render json: { status: :created, tutor_subject: @tutor_subject}
        else
        render json: { error: @tutor_subject.errors }
        end
    end
    end

    def destroy
        if @tutor_subject.tutor_id == @tutor.id
            @tutor_subject.destroy
            render json: { success: "Deleted" }, status: 204 
        else
            render json: { error: "You do not have permission to do this" }, status: 404
        end
    end

    private

    # Only allow a list of trusted parameters through.
    def set_tutor_subject
        @tutor_subject = TutorSubject.find(params[:id])
    end

    def tutor_subject_params
        params.require(:tutor_subject).permit(:tutor_id, :subject_id)
    end
end
