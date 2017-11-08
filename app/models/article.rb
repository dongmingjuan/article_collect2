class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :from, type: String
  field :url, type: String
  field :read_number, type: Integer
  validates_presence_of :title, message: "标题不能为空"
  validates_presence_of :url, message: "来源不能为空"
end
