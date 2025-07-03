class HabitItem < ApplicationRecord
  belongs_to :habit_tracker
  has_many :habit_logs, dependent: :destroy

  def log_for(date)
    habit_logs.find_by(date: date)
  end


  def completed_on?(date)
    log_for(date)&.completed
  end

  def current_streak
  streak = 0
  day = Date.today

  while habit_logs.exists?(date: day, completed: true)
    streak += 1
    day -= 1
  end
    streak
  end
end
