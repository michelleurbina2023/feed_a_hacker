class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_hacker

  def current_hacker
    @current_hacker ||= Hacker.find(session[:hacker_id]) if session[:hacker_id]
  end

  def authorize
    unless current_hacker
      redirect_to root_url
    end
  end

end
