class Reservation < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user
	has_many :payments
	

	validates :checkin, :checkout, :overlap => {:exclude_edges => ["checkin", "checkout"]}
end
