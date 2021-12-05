class AddUserToUserInfos < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_infos, :user, null: false, foreign_key: true
  end
end
