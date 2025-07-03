class CreateHabitItems < ActiveRecord::Migration[7.1]
  def change
    create_table :habit_items do |t|
      t.references :habit_tracker, null: false, foreign_key: true
      t.string :name
      t.text :notes
      t.string :frequency
      t.integer :target_per_day
      t.boolean :reminder
      t.time :reminder_time
      t.boolean :archived

      t.timestamps
    end
  end
end
