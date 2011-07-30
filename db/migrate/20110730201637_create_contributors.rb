class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :nickname
      t.text :avatar_url

      t.timestamps
    end
  end
end
