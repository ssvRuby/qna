class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :create_answer]


  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def create_answer
    puts "CREATE_ANSWER =+++++++++++++++++++++++++============================================>"
    p params
    puts "@question =+++++++++++++++++++++++++============================================>"
    p @question


    @answer = @question.answers.new(question_params)
    @answer.body = params[:answers_text]

    if @answer.save
      redirect_to @question
    else
      # render :new
      render @question
    end
  end


  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end



end
