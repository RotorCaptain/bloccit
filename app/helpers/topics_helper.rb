module TopicsHelper

  def user_is_authorized_for_topics?
        current_user && current_user.admin?
  end

  def render_posts(posts)
    output = ""
    posts.each do |post|
      output += '<div class="media"><div class="media-body"><h4 class="media-heading">'
      output += link_to post.title, topic_post_path(post.topic, post)
      output += "</h4><small>submitted #{time_ago_in_words(post.created_at)} ago by #{post.user}<br>"
      output += "#{post.comments.count } comments" if post.respond_to?('comments')
      output += "</small></div></div>"
    end
    output.html_safe
  end
end