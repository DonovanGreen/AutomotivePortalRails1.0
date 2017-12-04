class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.string :username
      t.integer :project_id
      t.boolean :client_view

      t.timestamps
    end
  end
end
