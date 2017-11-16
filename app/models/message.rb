class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  field :title, type: String
  field :active, type: Boolean, default: false
end
