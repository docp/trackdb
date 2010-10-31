class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @title = "Show Profile"
    @user = User.find(params[:id])
  end

  def new
    @title = "Sign up"
  end

end

