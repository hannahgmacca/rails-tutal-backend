class CreateUserInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :about
      t.string :suburb
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
