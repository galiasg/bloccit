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
     @question.resolved = params[:question][:resolved]

      if @question.save
 # #11
       flash[:notice] = "Question was saved."
       redirect_to @question
     else
 # #12
       flash[:error] = "There was an error saving the Question. Please try again."
       render :new
      end
  end
     #@Question = Question.new(params.require(:Question).permit(:title, :body))
     #if @Question.save
      # flash[:notice] = "Question was saved."
       #redirect_to @Question
     #else
      # flash[:error] = "There was an error saving the Question. Please try again."
       #render :new
     #end
   #end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

      if @question.save
       flash[:notice] = "Question was updated."
       redirect_to @question
     else
       flash[:error] = "There was an error saving the Question. Please try again."
       render :edit
     #@Question = Question.find(params[:id])
     #if @Question.update_attributes(params.require(:Question).permit(:title, :body))
      # flash[:notice] = "Question was updated."
       #redirect_to @Question
     #else
      # flash[:error] = "There was an error saving the Question. Please try again."
       #render :edit
      end
  end
  def destroy
     @question = Question.find(params[:id])

 # #8
    if @question.destroy
       flash[:notice] = "\"#{@question.title}\" was deleted successfully."
       redirect_to questions_path
     else
       flash[:error] = "There was an error deleting the Question."
       render :show
    end
  end
end

