class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created account!"
      redirect_to root_url
    else
      flash[:warning] = "Account creation failed: #{@user.errors.full_messages}"
      redirect_to new_user_path
    end
  end

  private


  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_name,
      :title,
      :company,
      :phone
    )
  end
end
