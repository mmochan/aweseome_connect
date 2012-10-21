class AddOauthToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :name, :string
    add_column :identities, :oauth_token, :string
    add_column :identities, :oauth_expires_at, :datetime
  end
end
