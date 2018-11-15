class OrdersController < ApplicationController
	before_action :find_order, only: [:edit, :destroy, :update, :show]

	def index
		@orders = Order.all.order("created_at DESC")
	end

	def new
		@order = Order.new
	end

	def update
		if @order.update(order_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def show
	end

	def create
		@order = Order.new(order_params)

		if @order.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def destroy
		@order.destroy
		redirect_to root_path
	end

	private

		def order_params
			params.require(:order).permit(:start_point, :restaurant_location, :customer_location, :fee)
		end

		def find_order
			@order = Order.find(params[:id])
		end

end
