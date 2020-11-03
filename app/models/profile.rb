class Profile < ApplicationRecord
	belongs_to :user
    mount_uploader :image, ImageUploader
#
#    validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
#	validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
validates :first_name, :last_name, :city, :contact_num, :presence => true

def is_portfolio?
    if user_signed_in? && current_user.portfolio.present?
      flash[:alert]=" plase submit portfolio"
    end
   end
	
	
end
