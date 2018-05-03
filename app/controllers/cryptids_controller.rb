class CryptidsController < ApplicationController
  before_action :set_user
  def index
    @search_term = params[:name]
    if @search_term
      @results = Cryptid.where("name ILIKE ?", "%#{@search_term}%")
    else
      @results = Cryptid.all
    end
  end

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

  def destroy
    @cryptid = Cryptid.find(params[:id])
    if !current_user.nil?
      if current_user.admin? || current_user == @cryptid.user
        @category = @cryptid.category
        @cryptid.destroy
        flash[:notice] = "You have killed the #{@cryptid.name}"
        redirect_to "/categories/#{@category.id}"
      else
        flash[:notice] = "You can can only delete Cryptids that you have created"
        redirect_to cryptid_path(@cryptid)
      end
    else
      flash[:notice] = "You must be logged in to delete"
      redirect_to cryptid_path(@cryptid)
    end
  end

  def edit
    @cryptid = Cryptid.find(params[:id])
  end

  def update
  @cryptid = Cryptid.find(params[:id])

  if !current_user.nil?
    if current_user.admin? || current_user == @cryptid.user
      @cryptid.name = cryptid_params[:name]
      @cryptid.photo = cryptid_params[:photo]
      @cryptid.description = cryptid_params[:description]
      @cryptid.region_id = cryptid_params[:region_id]
      @cryptid.category_id = cryptid_params[:category_id]
        if @cryptid.save
          flash[:message] = "Cryptid updated."
          redirect_to @cryptid
        else
          flash.now[:message] = @cryptid.errors.full_messages
          render :edit
        end
    else
      flash[:notice] = "You can can only edit Cryptids that you have created"
      redirect_to cryptid_path(@cryptid)
    end
  else
    flash[:notice] = "You must be logged in to edit"
    redirect_to cryptid_path(@cryptid)
  end
end

private

  def cryptid_params
    params.require(:cryptid).permit(:name, :photo, :description, :region_id, :category_id)
  end

  def set_user
    cookies[:userid] = current_user.id
  end

end
