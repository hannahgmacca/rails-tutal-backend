class CreateTutorSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :tutor_subjects do |t|
      t.references :tutor, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
