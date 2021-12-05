class Tutor < ApplicationRecord
  belongs_to :user_info
  has_many :subjects, through: :tutor_subjects
end
