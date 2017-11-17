class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String
  field :username, type: String
  mount_uploader :userphoto, UserphotoUploader
  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  has_many :articles

  field :active, type: Boolean, default: false
  field :role,              type: String
  ROLES = [:admin, :user, :collecter]
  def admin?
    role == 'admin'
  end
  field :credit, type: Integer, default: 0
  has_many :credit_logs
  def sign
    if self.credit_logs.between(created_at: [Date.today.beginning_of_day, Date.today.end_of_day]).any?
    else
      add_credit = rand(10)
      self.inc(credit: add_credit)
      self.credit_logs.create(credit: add_credit, type: "用户签到")
    end
  end
  has_many :comments
  has_many :favorites
end
