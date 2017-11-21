require "rails_helper"

RSpec.describe "User test", :type => :request do
  let!(:headers) { { "ACCEPT" => "application/json", } }
  let!(:user) { create :user }
  describe "Sign in user" do
    
    context "sign in valid user" do
      before do
        post "/graphql", params: { 'query' => "mutation { sign_in_user(email:\"#{user.email}\", password: \"#{user.password}\" ) }" }, headers: headers
      end
      it { expect(JSON.parse(response.body)['data']['sign_in_user']).to_not be_nil }
    end

    context "sign in with invalid email or password" do
        before do
          post "/graphql", params: { 'query' => "mutation { sign_in_user(email: \"test1234\", password: \"test1234\" ) }" }, headers: headers
        end

        it { expect(JSON.parse(response.body)['errors'][0]['message']).to be eq "Invalid email or password." }
        
    end

  end
end