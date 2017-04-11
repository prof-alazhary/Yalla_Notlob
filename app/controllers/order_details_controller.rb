class OrderDetailsController < ApplicationController
  before_action :set_order_detail, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :create

  # GET /order_details
  # GET /order_details.json
  def index
    @order = Order.find(params[:order_id])
    @order_details = @order.order_details
  end

  def show
  end

  # GET /order_details/new
  def new
    @order_detail = OrderDetail.new
  end

  # GET /order_details/1/edit
  def edit
  end
  def get_all_orders
    
  end
  def create
    @order_detail = OrderDetail.new({user_id: params[:u_id], order_id: params[:o_id], item: params[:item], price: params[:price], amount: params[:amount], comment: params[:comment]})
    respond_to do |format|
      if @order_detail.save
        data={"order": @order_detail} ; data['user_name']=@order_detail.user.name
        format.json { render json: data.to_json }
      else
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order_detail.update(order_detail_params)
        format.html { redirect_to @order_detail, notice: 'Order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_detail }
      else
        format.html { render :edit }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_details/1
  # DELETE /order_details/1.json
  def destroy
    @order_detail.destroy
    respond_to do |format|
      format.html { redirect_to order_details_url, notice: 'Order detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_detail
      @order_detail = OrderDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_detail_params
      params.require(:order_detail).permit(:user_id, :order_id, :item, :amount, :price, :comment)
    end
end
