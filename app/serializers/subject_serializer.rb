class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :label
  # has_many :tutors, through: :tutor_subjects
  # has_many :students, through: :student_subjects
end
