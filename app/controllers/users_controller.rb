class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params["user"])
    @user.password = BCrypt::Password.create(params["user"]["password"])
    @user.save
    redirect_to "/sessions/new"
    flash[:notice] = "Thanks for signing up! Please login to start your journey!"
  end
end
