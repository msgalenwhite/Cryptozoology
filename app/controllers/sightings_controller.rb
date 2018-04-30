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
    # @cryptid = Cryptid.find(params[:sighted_cryptid])
    binding.pry
    rating = params[:rating]

    @sighting = Sighting.new(
      sighting_params
    )

    # @sighting.sighted_cryptid ###etc

    if @sighting.save
      flash[:notice] = "Sighting successfully added."
      redirect_to cryptid_path(@cryptid)
    else
      flash[:alert] = @cryptid.errors.full_messages.join(" // ")
      render 'new'
    end
  end

  private

  def sighting_params
    params.require(:sighting).permit(:location, :description, :pic_url, :sighted_cryptid, :rating)
  end
end
