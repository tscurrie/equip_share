class AddEndDateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :end_date, :string
    add_column :requests, :date, :string
  end
end
