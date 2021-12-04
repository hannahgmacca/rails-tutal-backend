class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.integer :years_experience
      t.integer :rating
      t.references :user_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
