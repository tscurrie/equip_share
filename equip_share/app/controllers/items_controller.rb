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
		
		item_params = params.require(:item).permit(:name, :description, :user_id[@user])
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
		item_id = params[:id]
		@item = Item.find_by_id(item_id)

	end

	def update
		item_id = params[:id]
		item = Item.find_by_id(item_id)
		item_params = params.require(:item).permit(:name, :description)
		item.update_attributes(item_params)
		redirect_to item_path(item)
	end

	# def destroy
	# 	item_id = params[:id]
	# 	item = Item.find_by_id(item_id)
	# 	item.destroy

	# 	redirect_to user_items_path
	# end



end
