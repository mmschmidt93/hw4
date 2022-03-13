class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where({username: params["username"]})[0]
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session["user_id"] = @user.id
        redirect_to "/"
        flash[:notice] = "You are now logged in!"
      else 
        flash[:notice] = "Please try again."
        redirect_to "/sessions/new"
      end
   else
     redirect_to "/sessions/new"
   end
  end

  def destroy
    session["user_id"] = nil
  end
end
  