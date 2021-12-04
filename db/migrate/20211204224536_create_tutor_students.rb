class CreateTutorStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :tutor_students do |t|
      t.references :student, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true
      t.integer :review

      t.timestamps
    end
  end
end
