class UsersController < ApplicationController
  before_action :login_required, only: [:index, :edit, :show, :update, :destroy]
  def index
    @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar = nil
    if @user.save
      session[:user_id] = @user.id
      redirect_to questions_path, notice: "Q-Aへようこそ"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to questions_path, notice: "ユーザー情報の更新に成功しました"
    else
      render :edit
    end
  end


  private
    def user_params
      params.require(:user).permit(:nickname, :email, :admin, :password, :password_confirmation, :avatar)
    end

end
