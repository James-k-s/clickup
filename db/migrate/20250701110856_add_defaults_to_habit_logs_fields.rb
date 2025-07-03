class AddDefaultsToHabitLogsFields < ActiveRecord::Migration[7.1]
  def change
    change_column_default :habit_logs, :completed, false
    change_column_default :habit_logs, :times_completed, 0
  end
end
