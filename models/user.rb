class User < ActiveRecord::Base
	has_many :notes
	validates :username, presence: true
	validates :username, uniqueness: true
	validates :password, presence: true
end