require "rails_helper"

RSpec.describe AuthorizeApiRequest do
    let!(:user) { create :user }
    describe "decode headers" do
        it "invalid JWT token" do
            AuthorizeToken = AuthorizeApiRequest.new({ "Authorization": "Bearer testtokensample1" })
            AuthorizeToken.call
            expect(AuthorizeToken.errors).to_not be_empty  
        end

        it "valid JWT token" do
            AuthorizeToken = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
            check_token = AuthorizeApiRequest.new({"Authorization": AuthorizeToken})
            check_token.call
            expect(check_token).to_not be_empty
            
        end
    end

end