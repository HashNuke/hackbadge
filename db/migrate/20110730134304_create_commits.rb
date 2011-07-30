class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.integer :project_id
      t.text :commit_sha
      t.string :author_name
      t.string :author_email
      t.integer :author_user_id
      t.datetime :commit_timestamp

      t.timestamps
    end
  end
end
