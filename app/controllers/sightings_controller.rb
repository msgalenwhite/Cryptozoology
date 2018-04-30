class SightingsController < ApplicationController
<<<<<<< HEAD
  def destroy
      @sighting = Sighting.find(params[:id])
      if !current_user.nil?
       if current_user.admin? || current_user == @sighting.user
          @cryptid = @sighitng.cryptid
          @sighting.destroy
          flash[:notice] = "You have deleted this sighting"
          redirect_to "/cryptids/#{@cryptid.id}"
        else
          flash[:notice] = "You can can only delete Cryptids that you have created"
          redirect_to cryptid_path(@cryptid)
        end
      else
        flash[:notice] = "You must be logged in to delete"
        redirect_to cryptid_path(@cryptid)
      end
    end
  end
=======

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
        @cryptid = @sighitng.cryptid
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

  private

  def sighting_params
    params.require(:sighting).permit(:location, :description, :pic_url, :cryptid_id, :rating)
  end
end
>>>>>>> master
