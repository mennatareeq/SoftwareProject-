class Pdf < ActiveRecord::Base

	mount_uploader :attachment, AttachmentUploader
	validates :name, presence: true
	has_many :images
	end
