class CreateTwitterSocials < ActiveRecord::Migration
  def change
    create_table :twitter_socials do |t|
      t.string :user
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
