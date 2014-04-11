class CreateTodoitLists < ActiveRecord::Migration
  def change
    create_table :todoit_lists do |t|
      t.string :title
      t.string :description
      t.string :text

      t.timestamps
    end
  end
end
