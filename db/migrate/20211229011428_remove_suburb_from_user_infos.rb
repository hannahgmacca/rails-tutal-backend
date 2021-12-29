class RemoveSuburbFromUserInfos < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_infos, :suburb, :string
  end
end
