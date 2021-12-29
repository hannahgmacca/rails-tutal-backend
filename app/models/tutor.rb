class Tutor < ApplicationRecord
  belongs_to :user_info
  has_many :tutor_students
  has_many :requests
  has_many :tutor_subjects

  scope :filter_by_postcode, -> (postcode) { joins(:user_info).where('user_info.postcode > ? AND user_info.postcode < ?', postcode - 10, postcode + 10) }
  scope :filter_by_experience, -> (years_experience) { where( 'years_experience >= ?', years_experience)}
  scope :filter_by_subjects,  ->  (subjects) { joins(:tutor_subjects).where( 'tutor_subjects.subject_id = ?', subject_id )}
  scope :filter_by_rate, -> (rate) { where('rate <= ?', rate)}
  scope :filter_by_online, -> (is_online) { where(online: true)}
end
