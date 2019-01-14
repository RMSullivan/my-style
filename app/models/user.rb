class User < ActiveRecord::Base
  has_many :images

  validates :email, :pswd, presence: true

	has_secure_password


end
