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

end
