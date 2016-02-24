class RequestsController < ApplicationController
	def new
		@item = Item.find_by_id(params[:id])
		@request = @item.requests.new
	end
	def create
		@item = Item.find_by_id(params[:id])
		request_params = params.require(:request).permit(:start_date, :end_date)
		request_params[:borrower_id] = current_user.id
		request_params[:item_id] = @item.to_i
		request_params[:user_id] = 
		request = Request.new(request_params)

		if request.save
			redirect_to new_request_path
		end
	end



end
