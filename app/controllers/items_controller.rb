class ItemsController < ApplicationController
#  before_action :find_item, only: :update
  def update
    binding.pry
  end


  private

   def find_item
     @item = Item.find_by(id: params[:id])
   end

   def item_params
     params.require(:item).permit(:title)
   end
end
