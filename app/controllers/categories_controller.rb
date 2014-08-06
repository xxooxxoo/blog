class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(caregory_params)
    if @category.save
      redirect_to root_path
    end
  end
  def destroy
    @category = Category.find_by_id(params[:id])
    if @category.destroy
      redirect_to root_path
    end
  end
  private

  def caregory_params
    params.require(:category).permit(:name)
  end
end
