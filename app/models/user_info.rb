class UserInfo < ApplicationRecord
  belongs_to :user
  has_many :students
  has_many :tutors
end
