module UserHelper
	def gravatar_for(user)
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase);

		gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_id}";

		return image_tag(gravatar_url, {alt: user.name, class: 'gravatar'});
	end
end
