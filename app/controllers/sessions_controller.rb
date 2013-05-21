class SessionsController < ApplicationController
  def new
  end

  def create
    hacker = Hacker.authenticate(params[:email], params[:password])
    if hacker
      session[:hacker_id] = hacker.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:hacker_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
