class TutorsSerializer < ActiveModel::Serializer
  has_many :students, through: :tutor_students
  has_many :requests
  has_many :subjects, through: :tutor_subjects

  attributes :id, :years_experience, :rating, :rate
end
