class HabitLogsController < ApplicationController
  def toggle
    @habit_item = HabitItem.find(params[:id])
    @habit_log = @habit_item.habit_logs.find_or_initialize_by(date: Date.today)
    @habit_log.completed = !@habit_log.completed
    @habit_log.save!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to habit_trackers_path } # fallback
    end
  end
end
