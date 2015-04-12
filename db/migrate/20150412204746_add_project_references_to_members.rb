class AddProjectReferencesToMembers < ActiveRecord::Migration
  def change
    add_reference :members, :project, index: true, foreign_key: true
  end
end
