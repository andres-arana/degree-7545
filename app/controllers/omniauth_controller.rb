class OmniauthController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_or_create_for_facebook(request.env['omniauth.auth'])
    sign_in_and_redirect user, event: :authentication
    if is_navigational_format?
      set_flash_message :notice, :success, kind: 'Facebook'
    end
  end
end
