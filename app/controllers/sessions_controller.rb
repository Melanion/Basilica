class SessionsController < ApplicationController
  def create
    @user = User.where(:name => params[:name]).first
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid name or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
