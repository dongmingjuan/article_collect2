class Picture
  include Mongoid::Document
  mount_uploader :photo, PhotoUploader
  has_and_belongs_to_many :articles
end
