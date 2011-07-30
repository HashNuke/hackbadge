class AddStartDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_date, :datetime
  end
end
