class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :edit, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    end
  end
  def destroy
    if @category.destroy
      redirect_to root_path
    end
  end

  def edit    
  end
  def update
    if @category.update(category_params)
      redirect_to root_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end


end
