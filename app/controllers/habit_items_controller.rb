class HabitItemsController < ApplicationController
  def toggle_today
    @habit_item = HabitItem.find(params[:id])
    log = @habit_item.habit_logs.find_or_initialize_by(date: Date.today)
    log.completed = !log.completed
    log.save!
    # Respond as needed (redirect, turbo_stream, etc.)
  end
end
