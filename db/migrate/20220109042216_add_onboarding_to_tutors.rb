class AddOnboardingToTutors < ActiveRecord::Migration[6.1]
  def change
    add_column :tutors, :onboarding, :boolean
  end
end
