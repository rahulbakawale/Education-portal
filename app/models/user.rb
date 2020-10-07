class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_one :portfolio
 # accepts_nested_attributes_for :portfolio
   def is_user?
   	 self.roles[0].name === 'user'
   end
end
