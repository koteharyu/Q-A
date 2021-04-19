class Admin::UsersController < ApplicationController
  before_action :are_you_admin?

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to admin_users_path, notice: "#{@user.email}を削除しました"
  end

  private
  def are_you_admin?
    redirect_to root_path unless current_user.admin?
  end
end
