class TransactionsController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
    @transaction = Transaction.new
  end

  def create

    @account = Account.transaction.build

  end

  def destroy
  end

  private

  def transaction_params
    params.require(:transaction).permit(:type_of_transaction, :amount, :account_id, :user_id)
  end
end
