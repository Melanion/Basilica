class Inventory
  include Mongoid::Document
  validates :owner, :presence => true, :uniqueness => true
  has_many :items, autosave: true
  accepts_nested_attributes_for :items, :autosave => true
  field :owner, type: String
end
