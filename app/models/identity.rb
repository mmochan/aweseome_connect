class Identity < ActiveRecord::Base
  belongs_to :user
  has_many :appdotnet_social
  
  attr_accessible :uid, :provider, :name, :oauth_token, :oauth_expires_at
  
  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth)
    #TwitterSocial.create(followers_count: auth["extra"]["raw_info"]["followers_count"])
    create(uid: auth['uid'], provider: auth['provider'], name: auth['info']['name'], oauth_token: auth['credentials']['token'], oauth_expires_at: auth['credentials']['expires_at'])
    
  end
  
  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    
  end
  
end
