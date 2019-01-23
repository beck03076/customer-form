class CustomersController < ApplicationController
  def index
  	@customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
  	@customer = Customer.new(allowed_params)
  	if @customer.save
  	redirect_to customers_path
    end
  end

  def destroy
  	@customer = Customer.find(params[:id])
  	if @customer.destroy
  		redirect_to customers_path
  	end
  end

  def allowed_params
   params.require(:customer).permit(:firstname, :lastname, :contact, :address)
  end

end
