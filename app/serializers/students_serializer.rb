class StudentsSerializer < ActiveModel::Serializer
  has_many :tutors, through: :tutor_students
  has_many :requests
  has_many :subjects, through: :student_subjects
  attributes :id
end
