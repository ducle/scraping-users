class HomeController < ApplicationController

  def index
    if request.post?
      user_names = params[:user_names].split(/\s|,/)
      flash[:notice] = "Process is starting ..."
    end
  end
end
