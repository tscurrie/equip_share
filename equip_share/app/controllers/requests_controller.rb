class RequestsController < ApplicationController
	def new
		@item = Item.find_by_id(params[:id])
		@request = @item.requests.new
	end
	def create
		
	end
end
