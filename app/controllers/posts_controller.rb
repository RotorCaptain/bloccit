class PostsController < ApplicationController

  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create]

  def show
    #find the post that corresponds to the id in the params that was passed to show and assign it to @post.
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    #create an instance variable, @post, then assign it an empty post returned by Post.new.
    @post = Post.new
  end

  def create
  #call Post.new to create a new instance of Post.

     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.build(post_params)

     @post.user = current_user

  # if saving the instance of post to the database was successful, we display a success message using flash[:notice] and redirect the user to the route generated by @post.
  #Redirecting to @post will direct the user to the posts show view.
     if @post.save
  #assign a value to flash[:notice]. The flash hash provides a way to pass temporary values between actions.
  #Any value placed in flash will be available in next action and then deleted.
        @post.labels = Label.update_labels(params[:post][:labels])
        @post.rating = Rating.update_rating(params[:post][:rating])
        flash[:notice] = "Post was saved."
        redirect_to [@topic, @post]
     else
  #if saving the instance of post was not successful, we display an error message and render the new view again.
        flash[:error] = "There was an error saving the post. Please try again."
        render :new
     end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
     @post.assign_attributes(post_params)

     if @post.save
       @post.labels = Label.update_labels(params[:post][:labels])
       @post.rating = Rating.update_rating(params[:post][:rating])
       flash[:notice] = "Post was updated."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

   def destroy
      @post = Post.find(params[:id])
      if current_user.moderator?
          flash[:error] = "You are not authorized for that action."
          redirect_to @post.topic

      else
        #call destroy on @post. If that call is successful, we set a flash message and redirect the user to the posts index view.
        #If destroy fails then we redirect the user to the show view using render :show.
        if @post.destroy
          flash[:notice] = "\"#{@post.title}\" was deleted successfully."
          redirect_to @post.topic
        else
          flash[:error] = "There was an error deleting the post."
          render :show
       end
     end
   end

   private
   def post_params
     params.require(:post).permit(:title, :body)
   end

   def authorize_user
     post = Post.find(params[:id])
     unless current_user == post.user || current_user.admin?
       flash[:error] = "You must be an admin to do that."
       redirect_to [post.topic, post]
     end
   end
end