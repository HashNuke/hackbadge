class AddProjectIdToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :project_id, :integer
  end
end
