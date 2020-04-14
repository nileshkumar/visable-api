class Api::V1::BankAccountsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    bank_accounts = customer.bank_accounts
    render json: bank_accounts, status: :ok
  end

  def show
    bank_account = BankAccount.find(params[:id])
    render json: bank_account, status: :ok
  end

  def tr
  end
end
