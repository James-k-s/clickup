class CreateHabitTrackers < ActiveRecord::Migration[7.1]
  def change
    create_table :habit_trackers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :archived

      t.timestamps
    end
  end
end
