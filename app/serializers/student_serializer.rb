class StudentSerializer < ActiveModel::Serializer
  # has_many :tutors, through: :tutor_students
  # has_many :subjects, through: :student_subjects
  belongs_to :user_info, serializer: UserInfoSerializer
  # has_many :tutors, through: :requests
  attributes :id, :DOB
end
