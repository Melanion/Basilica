class Inventory
  include Mongoid::Document
  has_many :items
  accepts_nested_attributes_for :items, :autosave => true
  belongs_to :user
  validates :user, :presence => true
end
