require 'elasticsearch/model'

class Listing < ActiveRecord::Base
	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks

	belongs_to :user
	has_many :users, through: :reservations
	has_many :reservations, :dependent => :destroy
	has_many :comments

	mount_uploaders :avatars, AvatarUploader
	acts_as_taggable
end

