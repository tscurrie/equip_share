class User < ActiveRecord::Base
	has_secure_password
	has_many :items, :dependent => :delete_all
	has_many :requests, through: :items

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end

	validates :first_name, :last_name, :email, :password, presence: true, length: {maximum: 255}
	validates :password, length: { minimum: 3, message: "must be at least 3 characters" }
	validates :email, uniqueness: true

	validates :email, format: { with: /@/ }, length: { minimum: 6 }



end
