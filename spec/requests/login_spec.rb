require "rails_helper"
RSpec.describe " request test ", :type => :request do
  headers = {"ACCEPT" => "application/json"}
  let!(:user) { create :user }
  
  describe  "login" do
    context "login with  credentials" do
      it " login return token " do 
        post "/sign_in", params:{ email: user.email, password: user.password }, headers: headers
        expect(response).to have_http_status(:ok)
      end
      it "invalid login token" do
        post "/sign_in", params:{ email: '11111', password: '11111' }, headers: headers
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

end