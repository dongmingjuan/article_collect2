class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :image, ImageUploader
  field :title, type: String
  field :content, type: String
  field :from, type: String
  field :url, type: String
  field :read_number, type: Integer
  field :vote, type: Integer, default: 0
  validates_presence_of :title, message: "标题不能为空"
  validates_presence_of :url, message: "来源不能为空"

  belongs_to :user
  has_and_belongs_to_many :labels
  has_and_belongs_to_many :pictures
  has_many :comments
  field :favorate, type: Boolean, default: false
  has_many :favorites
end
