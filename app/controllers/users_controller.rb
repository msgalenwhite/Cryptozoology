class UsersController < ApplicationController

  def index
    if current_user
      if current_user.admin?
        @users = User.all
      else
        flash[:notice] = "You must be logged in as an administrator to view this page."
        redirect_to root_path
      end
    else
      flash[:notice] = "You must be logged in as an administrator to view this page."
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if !current_user.nil?
      if current_user.admin?
        @user.destroy
        flash[:notice] = "You have deleted the user."
        redirect_to root_path
        end
    else
      flash[:notice] = "Only administrators can delete users"
      redirect_to root_path
    end
  end

end
