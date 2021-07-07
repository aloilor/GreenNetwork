class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  after_action :assign_role, only:[:create]

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication 
	    set_flash_message(:notice, :success, :kind => "Facebook") 
      assign_role()
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

  end

  def failure
    redirect_to root_path
  end

  def assign_role
    if not current_user.nil?
      current_user.set_reguser
    end
  end

end
