class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :title
      t.text :due_date

      t.timestamps null: false
    end
  end
end