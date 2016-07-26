class Payment < ActiveRecord::Base
	belongs_to :transaction
end
