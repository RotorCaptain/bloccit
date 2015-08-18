class AdvertisementsController < ApplicationController
  def index
    @advertisements= Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id]) 
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisment.title = params[:advertisement][:title]
    @advertisment.copy = params[:advertisement][:copy]
    @advertisment.price = params[:advertisement][:price]
    
      if @advertisment.save
    
        flash[:notice] = "Ad was saved."
        redirect_to @advertisment
      else
    
        flash[:error] = "There was an error saving the ad. Please try again."
        render :new
      end
  end
end