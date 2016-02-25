class RemoveColumnsStartDateEndDate < ActiveRecord::Migration
  def change
  	remove_column :requests, :start_date
  	remove_column :requests, :end_date
  	add_column :requests, :date, :datetime
  end
end
