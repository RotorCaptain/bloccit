class PostsController < ApplicationController

  def show
    @post
    @topic
  end

  def new
    set_topic
    @post = Post.new
   
  end

  def create
    @topic
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was saved."
        
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
  def edit
    @topic
    @post
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
       @post.labels = Label.update_labels(params[:post][:labels])
        flash[:notice] = "Post was updated."
        redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

end