class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :title
  # has_many :tutors, through: :tutor_subjects
  # has_many :students, through: :student_subjects
end
