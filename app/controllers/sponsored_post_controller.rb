class SponsoredPostController < ApplicationController
  def show
    @sponsored = Sponsored.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored = Sponsored.new
  end

  def edit
    @sponsored = Sponsored.find(params[:id])
  end
end
