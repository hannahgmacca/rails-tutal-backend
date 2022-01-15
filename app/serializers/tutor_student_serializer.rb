class TutorStudentSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :student, serializer: StudentSerializer
  belongs_to :tutor, serializer: TutorSerializer
end
