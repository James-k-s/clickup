class HabbitTrackersController < ApplicationController
  def index
    @habits = current_user.habit_trackers.all.order(created_at: :desc)
    @total_habit_items = HabitItem.all.count
    @total_habit_items_today = HabitLog.where(date: Date.today, completed: true).count
    @total_streaks = HabitLog.where(completed: true).count
    @total_streaks_above_two = HabitItem.joins(:habit_tracker).where(habit_trackers: { user_id: current_user.id })
    .select { |item| item.current_streak > 2 }
    .count

  end
end
