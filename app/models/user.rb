class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  attr_accessor :name, :password, :password_confirmation
  
  field :name, type: String
  field :password_digest, type: String
  field :balance, type: Integer
  
  has_one :inventory
  has_secure_password
  validates_presence_of :password, :on => :create
end
