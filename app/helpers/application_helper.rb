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
end
