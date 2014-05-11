class AddCompletedAtToTodoitItems < ActiveRecord::Migration
  def change
    add_column :todoit_items, :completed_at, :datetime
  end
end
