class CreditLog
  include Mongoid::Document
  include Mongoid::Timestamps
  field :credit, type: Integer
  field :type, type: String, default: '用户签到'
  belongs_to :user
end
