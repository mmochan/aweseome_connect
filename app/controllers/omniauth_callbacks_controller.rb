class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def all
    auth  = request.env["omniauth.auth"]
    @identity = Identity.find_with_omniauth(auth)


    if @identity.nil?
      @identity = Identity.create_with_omniauth(auth)
    end
    
    if signed_in?
      if @identity.user == current_user
        redirect_to root_url, notice: "Already linked that account!"
      else
        @identity.user = current_user
        @identity.save()
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        self.current_user = @identity.user
        redirect_to root_url, notice: "Signed in!"
      else
        redirect_to new_user_registration_url, notice: "Please finish registering"
      end
    end
    
  end
  
  alias_method :twitter, :all
  alias_method :facebook, :all
  alias_method :appdotnet, :all
end
