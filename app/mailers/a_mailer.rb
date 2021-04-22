class AMailer < ApplicationMailer

  def creation_answer
    @answer = params[:answer]
    mail(subject: "回答がありました", to: @answer.question.user.email, from: "q-a@example.com")
  end

  def creation_other_answers
    @user = params[:user]
    @answer = params[:answer]
    mail(subject: "そのほかの回答がありました", to: @user.email, from: "q-a@example.com")
  end
end
