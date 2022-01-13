class RemoveReviewFromTutorStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :tutor_students, :review
    add_column :tutor_students, :review, :string
  end
end
