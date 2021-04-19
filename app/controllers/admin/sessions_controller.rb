class Admin::SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user.admin?
      if user&.authenticate(session_params[:password])
        session[:user_id] = user.id
        redirect_to admin_users_path, notice: "管理者としてログインしました"
      else
        render :new
      end
      render :new
      flash.now notice: "管理者ではありません"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "ログアウトしました"
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
