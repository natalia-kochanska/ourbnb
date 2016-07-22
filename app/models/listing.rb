class Listing < ActiveRecord::Base
	belongs_to :user
	# has_many :tags, through: :listing_tags
	# has_many :listing_tags
	# has_many :users, through: :reservations
	# has_many :reservations, :dependent => :destroy

	mount_uploaders :avatars, AvatarUploader


	def self.search(search)
	  	where("description ILIKE ? || name ILIKE ? || address ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end
