class CreateAppdotnetSocials < ActiveRecord::Migration
  def change
    create_table :appdotnet_socials do |t|
      t.string :uid
      t.string :username
      t.integer :identity_id

      t.timestamps
    end
  end
end
