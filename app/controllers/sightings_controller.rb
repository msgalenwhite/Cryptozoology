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

  def destroy
    @sighting = Sighting.find(params[:id])
    if !current_user.nil?
      if current_user.admin? || current_user == @sighting.user
        @cryptid = @sighting.cryptid
        @sighting.destroy
        flash[:notice] = "You have deleted this sighting"
        redirect_to "/cryptids/#{@cryptid.id}"
      else
        flash[:notice] = "You can can only delete Cryptid Sightings that you have created"
        redirect_to cryptid_path(@cryptid)
      end
    else
      flash[:notice] = "You must be logged in to delete"
      redirect_to cryptid_path(@cryptid)
    end
  end

  def edit
    @sighting = Sighting.find(params[:id])
    @cryptids = Cryptid.all
    @rating_options = [
      [1,1],
      [2,2],
      [3,3],
      [4,4],
      [5,5]
    ]

    if current_user.nil? || (current_user != @sighting.user)
      flash[:notice] = "You can only edit your own sightings!"
      redirect_to cryptid_path(@sighting.cryptid)
    end
  end

  def update
    sighting = Sighting.find(params[:id])
    if sighting.update(sighting_params)
      cryptid = sighting.cryptid
      flash[:notice] = "Your sighting has been updated!"
      redirect_to cryptid_path(cryptid)
    else
      render 'edit'
    end
  end

  private

  def sighting_params
    params.require(:sighting).permit(:location, :description, :photo, :cryptid_id, :rating)
  end
end
