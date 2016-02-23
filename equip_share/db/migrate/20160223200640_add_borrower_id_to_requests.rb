class AddBorrowerIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :borrower_id, :integer
  end
end
