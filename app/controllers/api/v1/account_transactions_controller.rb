class Api::V1::AccountTransactionsController < ApplicationController

  def index
    if params[:deposit]
      status = DepositMoney.new(params[:bank_account_id], params[:amount]).deposit
      render json: status, status: :ok
    elsif params[:withdraw]
      status = WithdrawMoney.new(params[:bank_account_id], params[:amount]).withdraw
      render json: status, status: :ok
    elsif params[:transfer]
      status = TransferMoney.new(params[:bank_account_id],params[:to_account_id], params[:amount]).transfer
      render json: status, status: :ok
    elsif params[:balance]
      bank_account = BankAccount.find(params[:bank_account_id])
      transactions = bank_account.account_transactions.order('created_at DESC').limit(10)
      render json: "Balance:$#{bank_account.balance}", status: :ok
    else
      bank_account = BankAccount.find(params[:bank_account_id])
      transactions = bank_account.account_transactions.order('created_at DESC').limit(10)
      render json: transactions, status: :ok
    end
  end
end
