class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2] # add these two!


  has_one :profile
  has_one :portfolio
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :jobs, :through => :likes
  has_many :friendlists, :dependent => :destroy
  has_many :jobs, :dependent => :destroy
  has_many :posts, :dependent => :destroy
 # accepts_nested_attributes_for :portfolio
 def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
          #user.name = auth.info.name # assuming the user model has a name
         # user.username = auth.info.name.delete(' ') # assuming the user model has a username
          #user.image = auth.info.image # assuming the user model has an image
          # If you are using confirmable and the provider(s) you use validate emails,
          # uncomment the line below to skip the confirmation emails.
          # user.skip_confirmation!
        end
      end
 
   def is_user?
    self.roles[0]
   	# self.roles[0].name.downcase === 'user'
   end

  def requests(user_id)
      self.friendlists.find_by(:user_id => user_id)
  end

  def get_friendlist(user)
    self.friendlists.find_by(:friend_id => user.id) || user.friendlists.find_by(:friend_id => self.id)
  end

  def isAcceptButton(user)
    Friendlist.where(:friend_id => user.id, :status => 'Pending' )[0]
  end
end
