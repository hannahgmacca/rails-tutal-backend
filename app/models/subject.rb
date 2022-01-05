class Subject < ApplicationRecord
    # Returns subjects based off name
    scope :filter_by_label,  ->  (subject) { where( 'label like ? ', "#{subject}%") }
end
