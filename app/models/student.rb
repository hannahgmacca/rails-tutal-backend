class Student < ApplicationRecord
  belongs_to :user_info
  has_many :subjects, through: :student_subjects
end
