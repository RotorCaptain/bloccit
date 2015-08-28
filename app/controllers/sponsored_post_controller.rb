class SponsoredPostController < ApplicationController
  
  def new
    @sponsored = SponsoredPost.new
  end
  
  def show
    @topic = Topic.find(params[:topic_id])
    @sponsored = SponsoredPost.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @sponsored = SponsoredPost.find(params[:id])
  end
end
