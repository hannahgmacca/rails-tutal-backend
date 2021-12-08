class StudentSubjectSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :subject, serializer: SubjectSerializer
  belongs_to :student, serializer: StudentSerializer
end
