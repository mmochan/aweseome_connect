class Identity < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :uid, :provider
  
  def self.find_with_omniauth(auth)

    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth)
    #TwitterSocial.create(followers_count: auth["extra"]["raw_info"]["followers_count"])
    create(uid: auth['uid'], provider: auth['provider'])
    
  end
  
end
