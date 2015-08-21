class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id]) 
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new
    @question.title = params[:advertisement][:title]
    @question.body = params[:advertisement][:body]
    @question.resolved = params[:advertisement][:resolved]
    
      if @question.save
    
        flash[:notice] = "Question was saved."
        redirect_to @question
      else
    
        flash[:error] = "There was an error saving the question. Please try again."
        render :new
      end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def resolved
    @question = Question
    @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
  end

  def destroy
     @question = Question.find(params[:id])
      
      if @question.destroy
        flash[:notice] = "\"#{@question.title}\" was deleted successfully."
        redirect_to posts_path
      else
        flash[:error] = "There was an error deleting the question."
        render :show
      end
  end
end
