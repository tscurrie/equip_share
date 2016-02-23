class RequestsController < ApplicationController
	def new
		@request = Request.new
		item_id = params[:id] 
	end
end
