class UsersController < ApplicationController
  before_action :login_required, only: [:index, :edit, :show, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to questions_path, notice: "Q-Aへようこそ"
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :admin, :password, :password_confirmation)
    end
end
