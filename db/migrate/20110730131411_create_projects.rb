class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :github_repo_name
      t.integer :user_id
      t.boolean :private_repo
      t.integer :event_id

      t.timestamps
    end
  end
end
