class CreateFacebookSocials < ActiveRecord::Migration
  def change
    create_table :facebook_socials do |t|
      t.string :user
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
