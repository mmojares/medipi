class Link
  include Mongoid::Document
  field :url, type: String
  field :description, type: String
end
