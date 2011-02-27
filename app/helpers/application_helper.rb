module ApplicationHelper
  TOPIC_DELIMITER = ', '

  def title(page_title)  
    content_for(:title) { page_title }  
  end

  def topic_tags(topics)
    topics.split(TOPIC_DELIMITER).each_with_object("") do |topic, result|
      result << link_to(topic, "/people?topic=#{topic}", :class => 'topic-tag')
    end
  end
end
