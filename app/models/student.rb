class Student < ApplicationRecord
  belongs_to :user_info
  has_many :tutor_students
  has_many :subjects, through: :student_subjects
  has_many :requests
end
