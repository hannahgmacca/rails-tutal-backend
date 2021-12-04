class AddRateToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :rate, :integer
  end
end
