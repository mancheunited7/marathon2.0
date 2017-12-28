class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook(request.env["omniauth.auth"],current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind:"Facebook") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["divise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    @user = User.find_for_twitter(request.env["omniauth.auth"],current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind:"twitter") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["divese.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def google
    @user = User.find_for_google(request.env["omniauth.auth"],current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind:"Google") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def instagram
    @user = User.find_for_instagram(request.env["omniauth.auth"],current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind:"instagram") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.instagram_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
