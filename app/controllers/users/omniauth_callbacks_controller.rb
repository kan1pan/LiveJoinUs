class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?

      @artist = Artist.find_by(user_id: @user.id)
      @organizer = Organizer.find_by(user_id: @user.id)
      unless @artist.blank? && @organizer.blank?
        sign_in_and_redirect @user, event: :authentication
      else
        sign_in @user
        redirect_to edit_user_path(@user, event: :authentication)
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?

      @artist = Artist.find_by(user_id: @user.id)
      @organizer = Organizer.find_by(user_id: @user.id)
      unless @artist.blank? && @organizer.blank?
        sign_in_and_redirect @user, event: :authentication
      else
        sign_in @user
        redirect_to edit_user_path(id: @user.id)
      end
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end

end
