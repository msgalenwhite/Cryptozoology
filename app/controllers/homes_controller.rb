class HomesController < ApplicationController
  before_action :set_user
  def index
  end
  
private

  def set_user
    cookies[:userid] = current_user.id
  end

end
