class AddBorrowerIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :borrower_id, :string
    add_column :requests, :integer, :string
  end
end
