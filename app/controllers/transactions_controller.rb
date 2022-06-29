class TransactionsController < ApplicationController
  def index
    @transactions = Entity.where(user: current_user)
  end

  def show
    @transaction = Entity.find(params['id'])
    @category = Group.find(@transaction.group_id)
  end

  def new
    @category = Group.find(params['id'])
    @transaction = Entity.new
  end

  def create
    transaction = Entity.new(transaction_params)

    if transaction.save
      redirect_to root_path, notice: 'Transaction added successfully'
    else
      render new, alert: 'Transaction could not be added successfully'
    end
  end

  private

  def transaction_params
    params.require(:entity).permit(:user, :group_id, :name, :amount).reverse_merge(user: current_user)
  end
end