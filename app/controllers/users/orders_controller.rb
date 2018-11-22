module Users
  class OrdersController < ApplicationController
    # GET /users/:user_id/orders
    def index
      @user = User.includes(:orders).find(params[:user_id])
      @orders = @user.orders
      # to allow csv and xls formats to be downloaded for user data
      respond_to do |format|
      	format.html
      	format.csv { send_data @orders.to_csv }
      	format.xls { send_data @orders.to_csv(col_sep: "\t") }
      end
    end
  end
end