class TransactionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @transaction = Entity.new
  end

  def create
    transaction = Entity.new(transaction_params)

    if transaction.save
      redirect_to categories_path, notice: 'Transaction added successfully'
    else
      render new, alert: 'Transaction could not be added successfully'
    end
  end

  private

  def transaction_params
    params.require(:entity).permit(:user, :group, :name, :icon).reverse_merge(user: current_user)
  end
end