class HabitTrackersController < ApplicationController
  def index
    @habit = HabitItem.new
    @habits = current_user.habit_trackers.all.order(created_at: :desc)
    @total_habit_items = current_user.habit_items.all.count
    @total_habit_items_today = current_user.habit_logs.where(date: Date.today, completed: true).count
    @total_streaks = current_user.habit_logs.where(completed: true).count
    @total_streaks_above_two = current_user.habit_items.joins(:habit_tracker).where(habit_trackers: { user_id: current_user.id })
    .select { |item| item.current_streak > 1 }
    .count
  end

end
