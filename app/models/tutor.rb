class Tutor < ApplicationRecord
  belongs_to :user_info
  has_many :tutor_students
  has_many :requests
  has_many :tutor_subjects
end
