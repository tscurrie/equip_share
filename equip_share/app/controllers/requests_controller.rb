class RequestsController < ApplicationController
	def new
		@item = Item.find(params[:item_id])
		@request = Request.new
	end
	def create
		@item = Item.find(params[:item_id])
		request_params = params.require(:request).permit(:start_date, :end_date)
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
		@outgoing = Request.where(borrower_id: @user)
	end


end
