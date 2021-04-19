class Admin::QuestionsController < ApplicationController
  def index
    @q = Question.all.ransack(params[:q])
    @questions = @q.result
  end

  private
  def are_you_admin?
    redirect_to root_path unless current_user.admin?
  end
end
