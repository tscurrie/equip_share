class ItemsController < ApplicationController
	

	def index
		@items = Item.all
	end

	def user_items
		
		if current_user.id.to_s == params[:id]
			@items = current_user.items
		else 
			redirect_to items_path
		end
	end
	
	def new
		if current_user.id.to_s == params[:id]
			@item = Item.new
		else
			redirect_to items_path
		end	
	end
	
	def create
		
		item_params = params.require(:item).permit(:name, :description)
		item_params[:user_id] = current_user.id
		item = Item.new(item_params)

		if item.save
			redirect_to user_items_path(item)
		end
	end

	def show
		item_id = params[:id]
		@item = Item.find_by_id(item_id)
	end

	def edit
		@item = Item.find_by_id(params[:id])
	end

	def update
		@item = Item.find_by_id(params[:id])
		item_params = params.require(:item).permit(:name, :description)
		@item.update_attributes(item_params)
		redirect_to user_items_path

	end

	def destroy
		@item = Item.find_by_id(params[:id])
		@item.destroy

		redirect_to user_items_path
	end

	def user_item_show

	end



end
