class TutorSubjectSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :subject, serializer: SubjectSerializer
  belongs_to :tutor, serializer: TutorSerializer
end
