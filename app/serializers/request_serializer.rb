class RequestSerializer < ActiveModel::Serializer
  attributes :id, :is_approved
  belongs_to :student, serializer: StudentSerializer
  belongs_to :tutor, serializer: TutorSerializer
end
