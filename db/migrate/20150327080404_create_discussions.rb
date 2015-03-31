class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :title
      t.text :description

      t.timestamps null: false
    end
  end
end
