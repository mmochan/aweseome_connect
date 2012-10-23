class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def all
    auth  = request.env["omniauth.auth"]
    @identity = Identity.find_with_omniauth(auth)
    binding.pry
    if @identity.nil?
      # If no identity was found, create a brand new one here
      @identity = Identity.create_with_omniauth(auth)
    end
    
    if signed_in?
      if @identity.user == current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it 
        # is the current user. So the identity is already associated with 
        # this user. So let's display an error message.
        @identity.update_attributes(oauth_token: auth['credentials']['token'], oauth_expires_at: auth['credentials']['expires_at'])
        redirect_to root_url, notice: "Already linked that account!"
      else
        # The identity is not associated with the current_user so lets 
        # associate the identity
        @identity.user = current_user
        @identity.save()
        @identity.update_attributes(oauth_token: auth['credentials']['token'], oauth_expires_at: auth['credentials']['expires_at'])        
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        # The identity we found had a user associated with it so let's 
        # just log them in here
        current_user = @identity.user
        @identity.update_attributes(oauth_token: auth['credentials']['token'], oauth_expires_at: auth['credentials']['expires_at'])
        redirect_to root_url, notice: "Signed in!"
      else
        # No user associated with the identity so we need to create a new one
        redirect_to new_user_registration_url, notice: "Please finish registering"
      end
    end
    
  end
  
  alias_method :twitter, :all
  alias_method :facebook, :all
  alias_method :appdotnet, :all
end
