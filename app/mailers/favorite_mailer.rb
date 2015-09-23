class FavoriteMailer < ApplicationMailer
  default from: "rotorcaptain@hotmail.com"
    
  def new_comment(user, post, comment)
 
    headers["Message-ID"] = "<comments/#{comment.id}@hotmail.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@hotmail.com>"
    headers["References"] = "<post/#{post.id}@hotmail.com>"
 
    @user = user
    @post = post
    @comment = comment
 
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
  
  def new_post(user, post)

    headers["Message-ID"] = "<post/#{post.id}@gmail.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@gmail.com>"
    headers["References"] = "<post/#{post.id}@gmail.com>"

    @user = user
    @post = post


    mail(to: user.email, subject: "You (#{user.name}) are following the post: #{post.title}")
  end
end
