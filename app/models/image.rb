class Image < ActiveRecord::Base
  # has_attached_file :page
  acts_as_commentable
  belongs_to :pdf
end
