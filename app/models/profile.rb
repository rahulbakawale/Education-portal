class Profile < ApplicationRecord
	belongs_to :user
    mount_uploader :image, ImageUploader
#
#    validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
#	validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
#	validates :first_name, :last_name, :city, :contact_num, presence: true
#
	
end
