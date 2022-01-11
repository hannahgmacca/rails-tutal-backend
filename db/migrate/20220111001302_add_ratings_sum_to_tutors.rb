class AddRatingsSumToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :ratings_sum, :integer, :default => 0
  end
end
