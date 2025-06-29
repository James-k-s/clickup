class AddStatusToListItems < ActiveRecord::Migration[7.1]
  def change
    add_column :list_items, :status, :string
  end
end
