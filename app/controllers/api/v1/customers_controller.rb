class Api::V1::CustomersController < ApplicationController

  def index
    customers = Customer.all
    render json: customers, status: :ok
  end

  def show
    customer = Customer.find(params[:id])
    bank_accounts = customer.bank_accounts
    render json: bank_accounts, status: :ok
  end
end
