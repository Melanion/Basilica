class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  attr_accessible :name, :password, :password_confirmation, :balance
  validates :name, presence: true, uniqueness: true
  
  field :name, type: String
  field :password_digest, type: String
  field :balance, type: Integer
  
  class << self
    def find_by_name(name)
      if where(:name => /#{name}/i).exists?
        return where(:name => /#{name}/i).first
      else
        return nil
      end
    end
  end
end
