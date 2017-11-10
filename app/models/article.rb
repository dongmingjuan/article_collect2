class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :image, ImageUploader
  field :title, type: String
  field :content, type: String
  field :from, type: String
  field :url, type: String
  field :read_number, type: Integer
  field :image, type: String
  validates_presence_of :title, message: "标题不能为空"
  validates_presence_of :url, message: "来源不能为空"

  belongs_to :user
  has_and_belongs_to_many :labels
  has_and_belongs_to_many :pictures
end
