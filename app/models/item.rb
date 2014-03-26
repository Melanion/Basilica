class Item
  include Mongoid::Document
  belongs_to :inventory
  validates :item_id, :presence => true, :uniqueness => { :scope => :meta } 
  validates :meta, :presence => true
  field :item_id, type: Integer
  field :meta, type: Integer
  field :name, type: String
  field :img_url, type: String
  field :quantity, type: Integer
  field :value, type: Integer
end
