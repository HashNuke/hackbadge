class AddVotesCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :votes_count, :integer, :default=>0
  end
end
