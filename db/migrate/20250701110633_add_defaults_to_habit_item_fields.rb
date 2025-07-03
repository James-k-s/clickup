class AddDefaultsToHabitItemFields < ActiveRecord::Migration[7.1]
  def change
    change_column_default :habit_items, :target_per_day, 1
    change_column_default :habit_items, :reminder, false
    change_column_default :habit_items, :archived, false
  end
end
