class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :projectcategory_id
      t.string :start
      t.string :end
      t.boolean :allDay
      t.string :category_color

      t.timestamps
    end
  end
end
