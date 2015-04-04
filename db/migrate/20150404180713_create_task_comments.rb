class CreateTaskComments < ActiveRecord::Migration
  def change
    create_table :task_comments do |t|
      t.text :body

      t.timestamps null: false
    end
  end
end
