class Public::DeliveriesController < ApplicationController

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      redirect_to deliveries_path
    else
      render :index
    end
  end

  def update
    delivery = Delivery.find(params[:id])
    delivery.update(delivery_params)
    redirect_to deliveries_path
  
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to deliveries_path
  end

  private
def delivery_params
  params.require(:delivery).permit(:name, :post_code, :address, :costomer_id)
end
end
