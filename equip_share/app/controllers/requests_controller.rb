class RequestsController < ApplicationController
	def new
		
			@item = Item.find(params[:item_id])
			@request = Request.new 

	end
	def create
			
				@item = Item.find(params[:item_id])
				request_params = params.require(:request).permit(:date,)
				request_params[:borrower_id] = current_user.id
				request_params[:item_id] = @item
				request_params[:user_id] = @item.user.id
				@request = Request.new(request_params)

		if @request.save
			@item.requests.push(@request)
			redirect_to user_path(current_user)
		end
	end

	def incoming
		@user = User.find(params[:id])
		@item = Item.find(params[:id])
		@incoming = Request.where(user_id: @user)

		# get the item object from the item id assoc. with @incoming
		# incoming_item = Item.find(@incoming[0].item_id)
		# get the specific name from that incoming_item object
		# this has the @ so that it can be used for the html.erb
		# @item_name = incoming_item.name

		# for borrower, lender, etc. copy the above structure to access the specific borrower by id, etc.

		@outgoing = Request.where(borrower_id: @user)



	end


end
