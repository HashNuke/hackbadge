class ChangeSlugToUnique < ActiveRecord::Migration
  def up
  
    change_column :events, :slug, :string, :unique=>true
  
  end

  def down
  end
end
