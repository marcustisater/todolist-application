class CreateTodoitItems < ActiveRecord::Migration
  def change
    create_table :todoit_items do |t|
      t.references :todoit_list, index: true
      t.string :content

      t.timestamps
    end
  end
end
