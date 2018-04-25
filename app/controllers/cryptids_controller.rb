class CryptidsController < ApplicationController
  def show
    @cryptid = Cryptid.find(params[:id])
  end
end
