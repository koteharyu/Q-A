class AnswersController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    @answer = question.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to question, notice: "回答しました"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end