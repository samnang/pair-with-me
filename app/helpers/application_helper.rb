module ApplicationHelper
  DEFAULT_SIZE_AVATAR = 48
  TOPIC_DELIMITER = ', '

  def title(page_title)  
    content_for(:title) { page_title }  
  end

  def avatar_url(email, size = DEFAULT_SIZE_AVATAR)
    gravatar_id = Digest::MD5::hexdigest(email).downcase  

    "http://gravatar.com/avatar/#{gravatar_id}.png?d=mm&s=#{size}"
  end

  def topic_tags(topics)
    topics.split(TOPIC_DELIMITER).each_with_object("") do |topic, result|
      result << link_to(topic, "/people?topic=#{topic}", :class => 'topic-tag')
    end
  end

  def edit_in_place(object, field, options={})
    defaults = {:nil => "Click to edit #{field.to_s.gsub('_', ' ')}"}.merge(options)

    if user_signed_in? and view_logged_in_user_profile?
      best_in_place object, field, defaults
    else
      object.send(field)
    end
  end
end
