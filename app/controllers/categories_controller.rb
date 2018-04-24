class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @cryptids = [{name: "cryptid1", updated_at: 1, id: 1}, {name: "cryptid2", updated_at: 2, id: 2}, {name: "cryptid3", updated_at: 3, id: 3}]
    # To be replaced by @category.cryptids
    @spotted = {name: "cryptid1", updated_at: 1, id: 1}
    # To be replaced by @cryptids.order(:updated_at).first
  end
end
