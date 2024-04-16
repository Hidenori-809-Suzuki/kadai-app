class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @imageposts = @user.imageposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  # ユーザー登録機能はないので削除する
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end
end
