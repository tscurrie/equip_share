class Request < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :borrower, :class_name => 'User', :foreign_key => 'borrower_id'
  belongs_to :item

  def user
  	owner
  end
end
