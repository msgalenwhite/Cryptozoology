class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @cryptids = @category.cryptids
  end
end
