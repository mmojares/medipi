class Chair
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :name_type, type: String
  
  embedded_in :table
  
end
