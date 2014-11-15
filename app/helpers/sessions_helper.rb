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

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Check whether a user is currently logged in to the app.
  #
  # Returns true if a user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
