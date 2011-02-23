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

  def edit_in_place(object, field, options={})
    defaults = {:nil => "Click to edit #{field.to_s.gsub('_', ' ')}"}.merge(options)

    if viewing_logged_in_user_profile?
      best_in_place object, field, defaults
    else
      object.send(field)
    end
  end
end
