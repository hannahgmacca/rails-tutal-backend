class TutorSubject < ApplicationRecord
  belongs_to :tutor
  belongs_to :subject

  scope :filter_by_subject,  ->  (subject) { where( 'subject_id = ?', subject )}
end
