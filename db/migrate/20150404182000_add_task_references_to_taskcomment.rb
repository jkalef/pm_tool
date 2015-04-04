class AddTaskReferencesToTaskcomment < ActiveRecord::Migration
  def change
    add_reference :task_comments, :task, index: true, foreign_key: true
  end
end
