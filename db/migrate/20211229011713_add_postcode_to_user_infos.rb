class AddPostcodeToUserInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :user_infos, :postcode, :integer
  end
end
