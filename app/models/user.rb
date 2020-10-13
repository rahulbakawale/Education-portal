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

  def requests(user_id)
      self.friendlists.find_by(user_id: user_id)
  end

  def get_friendlist(user)
    self.friendlists.find_by(friend_id: user.id) || user.friendlists.find_by(friend_id: self.id)
  end

  def isAcceptButton(user)
    Friendlist.where(friend_id: user.id, status: 'Pending' )[0]
  end
end
