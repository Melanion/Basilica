class Item
  include Mongoid::Document
  validates :item_id, :presence => true, :uniqueness => { :scope => :meta } 
  validates :meta, :presence => true
  attr_accessible :item_id, :meta, :name, :img_url, :quantity, :value
  field :item_id, type: Integer
  field :meta, type: Integer
  field :name, type: String
  field :img_url, type: String
  field :quantity, type: Integer
  field :value, type: Integer
end
