class HabitTracker < ApplicationRecord
  belongs_to :user
  has_many :habit_items, dependent: :destroy

  def today_progress_percent
    total = habit_items.count
    return 0 if total == 0
    completed = habit_items.select { |item| item.completed_on?(Date.today) }.count
    ((completed.to_f / total) * 100).round
  end

end
