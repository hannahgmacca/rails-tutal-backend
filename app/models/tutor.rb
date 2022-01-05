class Tutor < ApplicationRecord
  belongs_to :user_info
  has_many :tutor_students
  has_many :requests
  has_many :tutor_subjects

  # Returns tutors within 10 postcodes of user input
  scope :filter_by_postcode, -> (postcode) { joins(:user_info).merge(UserInfo.filter_by_postcode(postcode))}
  # Returns tutors with a minumum level of experience
  scope :filter_by_experience, -> (years_experience) { where( 'years_experience >= ?', years_experience)}
  # Returns tutors that have a subject
  scope :filter_by_subject,  ->  (subject) { joins(:tutor_subjects).merge(TutorSubject.filter_by_subject(subject) )}
  # Returns tutors with a max rate
  scope :filter_by_rate, -> (rate) { where('rate <= ?', rate)}
  # Returns tutors that are online
  scope :filter_by_online, -> { where(online: true)}
end
