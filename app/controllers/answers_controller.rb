class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.new(answer_params)
    if @answer.save
      # AMailer.with(answer: @answer).creation_answer.delivery_now
      # answers = Answer.where(question_id: @answer.question_id)
      # user_ids = answers.pluck(:user_id)
      # users = User.where(id: user_ids)
      # users.each do |user|
      #   next if user == current_user
      #   AMailer.with(user: user, answer: @answer).creation_other_answers.deliver_now
      # end
      redirect_to question_path(@answer.question_id), notice: "回答しました"
    else
      redirect_to question_path(question.id)
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:body).merge(question_id: params[:question_id])
    end
end
