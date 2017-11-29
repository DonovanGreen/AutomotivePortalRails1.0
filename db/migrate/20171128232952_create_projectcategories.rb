class CreateProjectcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :projectcategories do |t|
      t.string :title
      t.string :color
      t.integer :user_id

      t.timestamps
    end
  end
end
