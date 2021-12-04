class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.date :DOB
      t.references :user_info, null: false, foreign_key: true

      t.timestamps
    end
  end
end
