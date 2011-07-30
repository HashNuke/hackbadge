class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :token
      t.string :nickname
      t.string :gravatar_id

      t.timestamps
    end
  end
end
