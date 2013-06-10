class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :hacker
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
    add_index :projects, :hacker_id
  end
end
