class Profile < ApplicationRecord
		 # validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
		 # validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
		  validates :first_name, :last_name, :city, presence: true

  belongs_to :user
    mount_uploader :image, ImageUploader


end
