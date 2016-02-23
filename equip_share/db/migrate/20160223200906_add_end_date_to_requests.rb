class AddEndDateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :end_date, :datetime
  end
end
