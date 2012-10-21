class TwitterSocial < ActiveRecord::Base
  attr_accessible :email, :password, :user, :followers_count
end
