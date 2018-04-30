class SightingsController < ApplicationController
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
