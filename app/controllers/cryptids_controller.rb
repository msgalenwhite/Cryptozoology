class CryptidsController < ApplicationController
  def show
    @cryptid = Cryptid.find(params[:id])
  end

  def new
    @cryptid = Cryptid.new
  end

  def create
    @cryptid = Cryptid.new(cryptid_params)
    @cryptid.user = current_user

    if @cryptid.save
      flash[:notice] = "Cryptid succesfully added."
      redirect_to cryptid_path(@cryptid)
    else
      flash[:alert] = @cryptid.errors.full_messages.join(" // ")
      render 'new'
    end
  end

private

  def cryptid_params
    params.require(:cryptid).permit(:name, :pic_url, :description, :region_id, :category_id)
  end
end
