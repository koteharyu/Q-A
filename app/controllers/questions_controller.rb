class QuestionsController < ApplicationController
  before_action :login_required, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @questions = Question.all
  end

  def solves
    @solves_questions = Question.where(solved: true)
  end

  def unsolves
    @unsolves_questions = Question.where(solved: false)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to questions_path, notice: "質問を登録しました"
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = @question.answers.build
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to question_path(@question), notice: "質問を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to questions_path, notice: "質問を削除しました"
  end

  def solved
    @question = Question.find(params[:question_id])
    @question.solved = true
    if @question.save
      redirect_to @question, notice: "解決済にしました"
    else
      render :show
    end

  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :sovled)
    end
end
