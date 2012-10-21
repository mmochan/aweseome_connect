class AddFollowersCountToTwitterSocial < ActiveRecord::Migration
  def change
    add_column :twitter_socials, :followers_count, :integer
  end
end
