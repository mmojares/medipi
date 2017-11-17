require "rails_helper"

RSpec.describe AuthenticateUser do

  let!(:user) { create :user }

  context "encode Jwt" do
    
    it " encodes valid account and sends jwt token" do
      account = AuthenticateUser.new(user.email,user.password)
      account.call
      expect(account.errors).to be_empty
    end

    it "does not encodes Jwt because of invalid account" do
      account = AuthenticateUser.new("test","test")
      account.call
      expect(account.errors).to_not be_empty
    end
    
  end
end