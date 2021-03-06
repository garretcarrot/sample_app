module UsersHelper

  # Get a user's Gravatar for use in the profile sidebar.
  #
  # user  - The ActiveRecord object containing the email address the image
  #         is associated with.
  #
  # Returns the image tag of the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{size}"
    image_tag gravatar_url, alt: user.name, class: 'gravatar'
  end
end
