class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :genre
      t.string :info

      t.timestamps null: false
    end
  end
end
