class SightingsController < ApplicationController
  def new
    @sighting = Sighting.new
    @cryptids = Cryptid.all
    @rating_options = [
      [1,1],
      [2,2],
      [3,3],
      [4,4],
      [5,5]
    ]
  end

  def create
    @sighting = Sighting.new(sighting_params)
    @cryptid = Cryptid.find(sighting_params[:cryptid_id])
    @cryptids = Cryptid.all
    @rating_options = [
      [1,1],
      [2,2],
      [3,3],
      [4,4],
      [5,5]
    ]

    @sighting.user = current_user

    if @sighting.save
      flash[:notice] = "Sighting successfully added."
      redirect_to cryptid_path(@cryptid)
    else
      flash[:alert] = @sighting.errors.full_messages.join(" // ")
      render 'new'
    end
  end

  private

  def sighting_params
    params.require(:sighting).permit(:location, :description, :pic_url, :cryptid_id, :rating)
  end
end
