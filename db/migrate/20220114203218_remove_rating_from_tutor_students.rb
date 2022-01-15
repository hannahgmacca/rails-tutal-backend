class RemoveRatingFromTutorStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :tutor_students, :review
    remove_column :tutor_students, :rating
  end
end
