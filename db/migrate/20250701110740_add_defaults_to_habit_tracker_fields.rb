class AddDefaultsToHabitTrackerFields < ActiveRecord::Migration[7.1]
  def change
    change_column_default :habit_trackers, :archived, false
  end
end
