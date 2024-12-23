class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line
    process_callback("LINE")
  end

  def failure
    redirect_to root_path
  end

  private

  def process_callback(provider_name)
    @omniauth = request.env["omniauth.auth"]
    if @omniauth.present?
      @user = User.from_omniauth(@omniauth)
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: provider_name) if is_navigational_format?
      else
        session["devise.#{@omniauth['provider']}_data"] = @omniauth.except("extra")
        redirect_to new_user_registration_url
      end
    else
      flash[:alert] = "#{provider_name}ログインに失敗しました。"
      redirect_to new_user_session_path
    end
  end

  def fake_email(uid, provider)
    "#{uid}-#{provider}@example.com"
  end
end
