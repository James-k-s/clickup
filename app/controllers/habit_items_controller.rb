class HabitItemsController < ApplicationController
  def toggle_today
    @habit_item = HabitItem.find(params[:id])
    log = @habit_item.habit_logs.find_or_initialize_by(date: Date.today)
    log.completed = !log.completed
    log.save!
    # Respond as needed (redirect, turbo_stream, etc.)
  end

  def new
    @habit_item = HabitItem.new
  end

  def create
  habit_tracker = HabitTracker.find(params[:habit_tracker_id])
  @habit_item = habit_tracker.habit_items.build(habit_item_params)
  if @habit_item.save
    redirect_to habit_trackers_path, notice: "Habit item created!"
  else
    redirect_to habit_trackers_path, alert: "Unable to create habit item."
  end
end

  private

  def habit_item_params
    params.require(:habit_item).permit(:name, :habit_tracker_id)
  end
end
