class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :users, through: :reservations
	has_many :reservations, :dependent => :destroy
	has_many :comments

	mount_uploaders :avatars, AvatarUploader
	acts_as_taggable

	def self.search(search)
	  	where("description ILIKE ? || name ILIKE ? || address ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end
