class ChangeTitleToLabel < ActiveRecord::Migration[6.1]
  def change
    rename_column :subjects, :title, :label
  end
end
