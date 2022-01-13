class AddRatingToTutorStudent < ActiveRecord::Migration[6.1]
  def change
    add_column :tutor_students, :rating, :integer, :default => 0
  end
end
