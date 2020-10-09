class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_one :portfolio
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :jobs, through: :likes
  has_many :friendlists, dependent: :destroy
  has_many :jobs, dependent: :destroy
 # accepts_nested_attributes_for :portfolio
 
   def is_user?
   	 self.roles[0].name.downcase === 'user'
   end
end
