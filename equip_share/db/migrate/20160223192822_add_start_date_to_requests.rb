class AddStartDateToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :start_date, :string
    add_column :requests, :date, :string
  end
end
