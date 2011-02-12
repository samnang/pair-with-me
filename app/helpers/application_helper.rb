module ApplicationHelper
  DEFAULT_SIZE_AVATAR = 48

  def title(page_title)  
    content_for(:title) { page_title }  
  end

  def avatar_url(email, size = DEFAULT_SIZE_AVATAR)
    gravatar_id = Digest::MD5::hexdigest(email).downcase  

    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
