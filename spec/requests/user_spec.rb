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

        it { expect(JSON.parse(response.body)['errors'][0]['message']).to  eq "Invalid email or password." }
        
    end
  end
  describe "Create user" do
    before do
      post "/graphql", params: { 'query' => "mutation { sign_in_user(email: \"doctor@medifi.co\", password: \"1234qwer\") }" }, headers: headers
    end
    context "create user with valid data" do
        before do
          post "/graphql", params: { 'query' => "mutation { create_user(email: \"mico@gmail.com\", password: \"1234qwer\", name: \"Mico\"  ) { email }}" }, headers: headers
        end
      it { expect(JSON.parse(response.body)['data']['create_user']['email']).to eq "mico@gmail.com" }
    end

    context "create user with invalid data" do
      before do 
        post "/graphql", params: { 'query' => "mutation { create_user(email: \"mico@gmail.com\", password: \"1234qwer\" ) { email }}" }, headers: headers
      end
       it { expect(JSON.parse(response.body)['errors'][0]['message']).to  eq "Invalid data" }
    end
  end

  describe "Delete user" do
    let!(:user) { create :user}
    context "delete user with valid id " do
      before do
        post "/graphql", params: { 'query' => "mutation { delete_user(user_id: \"#{user.id}\") }" }, headers: headers      
      end
      it { expect(JSON.parse(response.body)['data']['delete_user']).to eq "true" }
    end    
  end

  describe "Update user" do
    let!(:user) { create :user }
    context "Update user with valid data" do
      before do
        post "/graphql", params: { 'query' => "mutation { update_user(user_id: \"#{user.id}\", name: \"updateuser\", email: \"#{user.email}\", password: \"passwordtest\" ) { id }}" }, headers: headers
      end
      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['data']['update_user'].count).to eq  1 }
    end
    context ("Update user with invalid data ") do
      before do
        post "/graphql", params: { 'query' => "mutation { update_user(user_id: \"#{user.id}\", name: \"\", email: \"#{user.email}\", password: \"passwordtest\" ) { id }}" }, headers: headers
      end
      it { expect(JSON.parse(response.body)['errors'][0]['message']).to eq "invalid data" }
      it { expect(JSON.parse(response.body)['data']['update_user']).to eq nil }
    end
  end
end