class HomeController < ApplicationController

  def index
    if request.post?
      user_names = params[:user_names].split(/\s|,/)
      User.enqueue_users(user_names)
      flash[:notice] = "Process is starting ..."
    end
  end
end
