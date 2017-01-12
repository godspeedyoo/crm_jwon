class UserSessionsController < ApplicationController
  def new
    puts "UserSessionsController#new"
    @user_session = UserSession.new
  end

  def create
    puts "#UserSessionsController#create"
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:notice] = "Welcome"
      redirect_to root_url
    else
      flash[:warning] = "Invalid Login"
      redirect_to action: :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
