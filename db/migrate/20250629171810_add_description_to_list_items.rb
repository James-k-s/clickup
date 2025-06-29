class AddDescriptionToListItems < ActiveRecord::Migration[7.1]
  def change
    add_column :list_items, :description, :string
  end
end
