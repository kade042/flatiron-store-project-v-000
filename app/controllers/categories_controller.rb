class CategoriesController < ApplicationController
  before_action :find_category, only: :show
  def show
  end


  private

   def find_category
     @category = Category.find_by(id: params[:id])
   end

   def category_params
     params.require(:category).permit(:title)
   end
end
