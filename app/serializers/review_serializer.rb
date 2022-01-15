class ReviewSerializer < ActiveModel::Serializer
	attributes :id, :review, :rating
	belongs_to :student, serializer: StudentSerializer
	belongs_to :tutor, serializer: TutorSerializer
end
  