module Users
  class OrdersController < ApplicationController
    # GET /users/:user_id/orders
    def index
      @user = User.includes(:orders).find(params[:user_id])
      @orders = @user.orders
    end
  end
end