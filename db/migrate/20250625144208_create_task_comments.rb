class CreateTaskComments < ActiveRecord::Migration[7.1]
  def change
    create_table :task_comments do |t|
      t.string :comment
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
