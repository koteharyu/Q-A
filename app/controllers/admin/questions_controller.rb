class Admin::QuestionsController < ApplicationController
  before_action :are_you_admin?
  def index
    @q = Question.all.ransack(params[:q])
    @questions = @q.result.page(params[:page])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to admin_questions_path, notice: "「#{@question.title}」を削除しました"
  end
  
end
