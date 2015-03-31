class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :title
      t.text :description
      t.text :due_date

      t.timestamps null: false
    end
  end
end
