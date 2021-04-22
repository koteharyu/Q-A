class QMailer < ApplicationMailer

  def email__question
    @answer = params[:answer]
    mail(subject: "回答が投稿されました", to: @answer.question.user.email, from: "q-a@example.com")
  end

end
