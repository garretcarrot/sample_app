module SessionsHelper

  # Log the given user into the sample application. 
  # This will expire when the browser window closes.
  #
  # Cookies created using `session` are automatically encrypted,
  # so this method is secure. Permanent cookies created with the
  # `cookie` method do not have this feature and are susceptible
  # to attacks.
  # 
  # user - The instance of the User model being logged in.
  #
  # Returns the user's id.
  def log_in(user)
    session[:user_id] = user.id
  end
end
