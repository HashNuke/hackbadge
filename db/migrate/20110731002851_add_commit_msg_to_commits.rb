class AddCommitMsgToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :commit_msg, :text
  end
end
