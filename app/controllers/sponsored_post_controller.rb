class SponsoredPostController < ApplicationController
  
  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored = Sponsored.new
  end
  
  def show
    @sponsored = Sponsored.find(params[:id])
  end

  def edit
    @sponsored = Sponsored.find(params[:id])
  end
end
