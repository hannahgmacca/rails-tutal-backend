class CreateStudentSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :student_subjects do |t|
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
