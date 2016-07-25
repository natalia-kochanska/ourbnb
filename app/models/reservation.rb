class Reservation < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user

	validates :checkin, :checkout, :overlap => {:exclude_edges => ["checkin", "checkout"]}
end
