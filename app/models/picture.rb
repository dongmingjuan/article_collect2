class Picture
  include Mongoid::Document
  mount_uploader :photo, PhotoUploader
  has_and_belongs_to_many :articles
  field :name, type: String
  field :type, type: String
  TYPES = [:vegetable, :person, :fruit, :snack]
end
