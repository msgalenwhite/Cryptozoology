class HomesController < ApplicationController
  before_action :set_user
  def index
  end

private

  def set_user
    if current_user
      cookies[:userid] = current_user.id
    else
      cookies[:userid] = 0
    end
  end

end
