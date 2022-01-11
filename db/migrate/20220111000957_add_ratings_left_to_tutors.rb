class AddRatingsLeftToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :ratings_left, :integer, :default => 0
  end
end
