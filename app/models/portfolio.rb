class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :experiences
  has_many :educas
  accepts_nested_attributes_for :educas, :allow_destroy => true
  accepts_nested_attributes_for :experiences, :allow_destroy => true
  #]validates :university, :companey_name, :skil, :description, presence: true

end

