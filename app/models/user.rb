class User < ApplicationRecord
	validates_presence_of :email
	validates_presence_of :password_digest
	validates_presence_of :api_key
end
