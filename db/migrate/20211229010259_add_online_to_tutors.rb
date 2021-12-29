class AddOnlineToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :online, :boolean
  end
end
