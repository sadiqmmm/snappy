class QuestionsController < ApplicationController
  before_filter :auth, only: [:create]
  
  def index
  	@question = Question.new
    @questions = Question.unsolved(params)
  end

  def create
  	@question = current_user.questions.build(params[:question])
  	if @question.save
  		flash[:success] = "Your question has been posted!"
  		redirect_to @question
  	else
      @question = Question.unsolved(params)
  		render 'index'
  	end  	
  end

  def show
    @question = Question.find(params[:id])
  end
end
