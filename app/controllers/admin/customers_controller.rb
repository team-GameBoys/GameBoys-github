class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.all
    # ページネーションをつけたいデータに.page(params[:page])を追加
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
  end
  
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :encrypted_password, :email)
  end
end
