class User < ActiveRecord::Base
	has_secure_password
	has_many :items, :dependent => :delete_all
	has_many :requests, through: :items

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end
