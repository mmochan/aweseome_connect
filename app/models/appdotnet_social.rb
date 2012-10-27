class AppdotnetSocial < ActiveRecord::Base
  
  belongs_to :identity
  
  include HTTParty
   base_uri 'alpha-api.app.net'
   
  attr_accessible :uid, :username
  


#  def timeline(which=:friends, options={})
#    options.merge!({:basic_auth => @auth})
#    self.class.get("/statuses/#{which}_timeline.json", options)
#  end
  
  def token(which=:friends, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/stream/0/token?access_token=#{self.identity.oauth_token}", options)
  end
  
  def user(which=:friends, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/stream/0/users/#{uid}?access_token=#{self.identity.oauth_token}", options)
  end

  def posts(which=:friends, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/stream/0/posts/#{uid}?access_token=#{self.identity.oauth_token}", options)
  end
  
  def following(which=:friends, options={})
    options.merge!({:basic_auth => @auth})
    self.class.get("/stream/0/users/#{uid}/following?access_token=#{self.identity.oauth_token}", options)
  end

end
