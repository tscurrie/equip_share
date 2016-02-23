class AddStartDateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :start_date, :datetime
  end
end
