class RegionsController < ApplicationController
  def show
    @region = Region.find(params[:id])
    @cryptids = @region.cryptids
  end
end
