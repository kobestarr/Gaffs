class OrdersController < ApplicationController
  
	before_action :make_sure_logged_in	


  def index
    @orders = current_user.orders.all

  end

  def show
    @order = current_user.orders.find(params[:id])

  end

  def new

  	#lets find the room from our routes
  	@gaff = Gaff.find(params[:gaff_id])
  	@order = @gaff.orders.new
  	@order.user = current_user

  end

  def create
	#the form has been submitted now lets save it!

  	@gaff = Gaff.find(params[:gaff_id])
  	@order = @gaff.orders.new(order_params)
  	@order.user = current_user  


  	if @order.save

      #we want to charge stripe with the token
      Stripe::Charge.create(card:@order.stripe_token,
       description: "Room on Onboard", amount:(@gaff.price * 100).to_i,
       currency: "gbp")


  		flash[:success] = "You placed an order on the gaff!!"
  		redirect_to gaff_path(@gaff)
  		
	   else

		render "new"


  	end


  end


  private

  def order_params

  	params.require(:order).permit(:stripe_token)
  end


end
