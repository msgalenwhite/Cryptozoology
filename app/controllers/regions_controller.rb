class RegionsController < ApplicationController
  def index
    redirect_to 'homes#index'
  end

  def show
    @region = Region.find(params[:id])
    @cryptids = @region.cryptids
  end
end
