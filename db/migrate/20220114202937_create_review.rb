class CreateReview < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :review
      t.references :student, null: false, foreign_key: true
      t.references :tutor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
