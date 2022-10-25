class Admin::CustomersController < ApplicationController
before_action :authenticate_admin!
  def index
    @customer = Customer.all
    # ページネーションをつけたいデータに.page(params[:page])を追加
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    # @customer = Customer.find_by(params[:customer_id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path
  end


  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :encrypted_password, :email, :is_active)
  end
end
