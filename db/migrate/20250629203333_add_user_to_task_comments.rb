class AddUserToTaskComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :task_comments, :user, null: false, foreign_key: true
  end
end
