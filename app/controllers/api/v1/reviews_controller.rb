class Api::V1::ReviewsController < ApplicationController
    before_action :set_student, only: %i[ add_review add_review destroy]
	before_action :set_tutor, only: %i[ get_my_reviews ]
	before_action :set_review, only: %i[ destroy ]

    def add_review
	already_exists = Review.find_by_tutor_id_and_student_id(review_params[:tutor_id], @student.id)
	if already_exists
		render json: { error: "Review has already been made" }, status: 401
	else
	@review = Review.new(review_params)
	@review.student_id = @student.id
	@tutor = Tutor.find(review_params[:tutor_id])
	@review.review = review_params[:review]
	@review.rating = review_params[:rating]
	@tutor.ratings_left += 1
	@tutor.ratings_sum += review_params[:rating]
	@tutor.rating = @tutor.ratings_sum / @tutor.ratings_left

        if @review.save && @tutor.save
            render json: { review: @review, tutor_rating: @tutor.rating }, status: :created
        else
            render json: {errors: @review.errors}, status: :unprocessable_entity
        end
	end
    end

    def destroy
        if @review.student_id == @student.id
            @review.destroy
            render json: { success: "Deleted" }, status: 204
        else
            render json: { error: "You do not have permission to do this" }, status: 404
        end
    end

    def get_my_reviews
        @reviews = Review.where(tutor_id: @tutor.id)

        render json: @reviews
    end

	def get_tutor_reviews
        @reviews = Review.where(tutor_id: params[:id])

        render json: @reviews
	end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
        @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
        params.permit(:student_id, :tutor_id, :review, :rating)
    end
end
