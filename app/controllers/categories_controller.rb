class CategoriesController < ApplicationController
  def index
    @categories = Group.includes(:entities).where(user: current_user)
  end

  def show
    @category = Group.find(params['id'])
    @transactions = Entity.where(user: current_user, group: @category)
  end

  def new
    @category = Group.new
  end

  def create
    category = Group.new(category_params)

    if category.save
      redirect_to categories_path, notice: 'Category added successfully'
    else
      render new, alert: 'Category could not be added successfully'
    end
  end

  private

  def category_params
    params.require(:group).permit(:user, :name, :icon).reverse_merge(user: current_user)
  end
end
