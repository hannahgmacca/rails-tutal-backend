class TutorSerializer < ActiveModel::Serializer
  # has_many :students, through: :requests
  # has_many :subjects, through: :tutor_subjects
  belongs_to :user_info, serializer: UserInfoSerializer
  # has_many :students, through: :tutor_students
  attributes :id, :years_experience, :rating, :rate
end
