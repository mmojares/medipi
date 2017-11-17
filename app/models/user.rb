class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
 
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  has_secure_password

  validates_presence_of :name, :email, :password_digest

end
