class Job < ApplicationRecord
 has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  has_many :likers, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
   def checkLikes(current_user)
  	return self.likes.find_by(user_id: current_user.id)
  end
end











#  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
##	has_many :comments, dependent: :destroy
##	has_many :likes, dependent: :destroy
##	has_many :likers, through: :likes, source: :user
##
## has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
##  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
##
##
##  def checkLikes(current_user)
##  	return self.likes.find_by(user_id: current_user.id)
##  end
 #end