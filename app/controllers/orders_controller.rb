class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    # @order = Order.new
    @user=current_user
    @order = @user.orders.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @user=User.find params[:user_id]
    @order = @user.orders.new(order_params)
    respond_to do |format|
      if @order.save
        friends_ids = params['order']['friends']
        friends_ids.each do |friend_id|
          User.find(friend_id).follow @order
        end
        format.html { redirect_to user_orders_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update({status: false})
        format.html { redirect_to user_orders_path, notice: 'Order was successfully marked as Finished.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :index }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to user_orders_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:meal, :rest_name, :menu_img, :menu_img, :menu_img_cache, :user_id)
    end
end
