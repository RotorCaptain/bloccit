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
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    if params[:question][:resolved].present?
      @question.resolved = params[:question][:resolved]
    end
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
    @question = Question.find(params[:id])
    @question.resolved = params[:question][:resolved]
    @question.save
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Your question has been updated"
      redirect_to @question
    else
      flash[:error] = "Sorry. There was a problem updating your question. Please try again."
      render :update
    end
  end
  
  def destroy
     @question = Question.find(params[:id])
      
      if @question.destroy
        flash[:notice] = "\"#{@question.title}\" was deleted successfully."
        redirect_to questions_path
      else
        flash[:error] = "There was an error deleting the question."
        render :show
      end
  end
end
