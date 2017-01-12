class HomeController < ApplicationController
  def index
    redirect_to login_url
  end
end
