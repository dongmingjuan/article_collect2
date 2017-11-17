class Favorite
  include Mongoid::Document
  include Mongoid::Timestamps
  field :username, type: String
  field :article_title, type: String
  belongs_to :user
  belongs_to :article
end
