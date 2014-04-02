class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  attr_accessible :name, :password, :password_confirmation
  validates_presence_of :password, :on => :create
  validates :name, presence: true, uniqueness: true
  
  field :name, type: String
  field :password_digest, type: String
  field :balance, type: Integer
  
  has_one :inventory
end
