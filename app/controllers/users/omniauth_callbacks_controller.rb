module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request_env_omniauth)
      if @user.persisted?
        sign_in @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
        redirect_to targets_path
      else
        session['devise.facebook_data'] = request_env_omniauth
        redirect_to new_user_registration_path
      end
    end

    def failure
      redirect_to root_path
    end

    def request_env_omniauth
      request.env['omniauth.auth']
    end
  end
end
