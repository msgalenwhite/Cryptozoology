class UsersController < ApplicationController

def index
  if current_user
    if current_user.admin?
      @users = User.all
    else
      @users = [current_user]
    end
  else
    flash[:notice] = "You must be logged in to view this page."
    redirect_to root_path
  end
end

end
