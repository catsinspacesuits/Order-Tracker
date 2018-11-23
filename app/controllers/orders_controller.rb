class OrdersController < ApplicationController
	before_action :find_order, only: [:edit, :destroy, :update, :show]

	def index
		@orders = Order.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
		# to allow csv and xls formats to be downloaded
		respond_to do |format|
			format.html
			format.csv { send_data @orders.to_csv }
			format.xls { send_data @orders.to_csv(col_sep: "\t") } # tab separate to work on excel
		end
	end

	def new
		@order = current_user.orders.build
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
		@order = current_user.orders.build(order_params)

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
			params.require(:order).permit(:start_point, :restaurant_location, :customer_location, :fee, :restaurant)
		end

		def find_order
			@order = Order.find(params[:id])
		end

end
