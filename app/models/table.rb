class Table
  include Mongoid::Document
  field :name, type: String
  field :quantity, type: Integer
  validates_presence_of :name
  
  embeds_many :chair
end
