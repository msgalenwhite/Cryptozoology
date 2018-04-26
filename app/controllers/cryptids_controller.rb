class CryptidsController < ApplicationController
  def show
    @cryptid = Cryptid.find(params[:id])
  end

  def new
    @cryptid = Cryptid.new
    @regions = Region.all
    @categories = Category.all
    end

  def create
    @cryptid = Cryptid.new(cryptid_params)
    @region = Region.where()
  end

private

  def cryptid_params
    params.require(:cryptid).permit(:name, :pic_url, :description)
  end
end
