class User < ActiveRecord::Base
  has_many :images

  validates :email, :password, presence: true



end
