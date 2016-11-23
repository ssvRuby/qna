class AnswersController < ApplicationController
  before_action :set_answer, only: [:show]
  before_action :set_question, only: [:show, :create]

  def show
  end

  def new
    # @answer = Answer.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question
    else
      # render :new
      render @question
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

end
