class UserInfo < ApplicationRecord
  belongs_to :user
  has_many :students
  has_many :tutors
  has_one_attached :main_image
  scope :filter_by_postcode, -> (postcode) { where('postcode > ? AND postcode < ?', postcode.to_i - 10, postcode.to_i + 10) }
end
