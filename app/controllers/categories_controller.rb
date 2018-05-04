class CategoriesController < ApplicationController
  def index
    redirect_to 'homes#index'
  end

  def show
    @category = Category.find(params[:id])
    @cryptids = @category.cryptids.sort_by{|c| c[:name]}
  end
end
