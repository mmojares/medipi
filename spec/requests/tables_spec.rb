require "rails_helper"

RSpec.describe "table test", :type => :request do
  
  let!(:user) { create :user }
  
  let!(:check_user) { JsonWebToken.encode( user_id: user.id) }
  let!(:headers) {{ "ACCEPT" => "application/json","Authorization" => "Bearer #{check_user}" }}

  describe "List of tables  get '/tables' " do

    context "list of data tables" do
      let!(:table) { create :table }

      before do
        post "/graphql", params: { 'query' => 'query { tablelists { id name }}' }, headers: headers
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['data']['tablelists'].count).to eq (Table.all.count) }
      
    end
    
    context "with no data " do
      before do
        post "/graphql", params: { 'query' => 'query { tablelists { id name } }' }, headers: headers
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['data']['tablelists'].count).to eq 0 }
      
    end

    context "with single data" do
      let!(:table) { create :table }
      before do
        post "/graphql", params: { "query" => "query { tablelist(table_id: \"#{table.id}\") { id } }" }, headers: headers
      end
      
      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['data']['tablelist'].count).to eq 1 }
       
    end

    context "with wrong single data" do
      let!(:table) { create :table } 
      before do
        post "/graphql", params: { 'query' => 'query { tablelist(table_id: "1") { id } }' }, headers: headers
      end
      it { expect(response).to have_http_status(:ok) }
      it { expect(JSON.parse(response.body)['data']['tablelist']).to eq nil }
    end

  end

  describe "create table" do

    context "create table with valid data" do

      before do
        post "/graphql", params: { 'query' => 'query { tablelists { id name }}' }, headers: headers
      end
        
    end

  end

end
    # context "without tables" do

    #   it "without data" do
    #       post "/graphql", headers: headers
    #       expect(response).to have_http_status(:ok)
    #   end

    # end
  #end
# describe " POST '/tables' " do

#     context "Create tables" do

        
#       it "has no data" do
#           post "/tables", params:{ table_name: { name: nil } },  headers: headers
#           expect(response).to have_http_status(:bad_request)
#       end

#         it "has valid data" do
#             post "/tables", params:{ table_name: { name: "My table" } },  headers: headers
#             expect(response).to have_http_status(:created)
#         end
        
#     end
# end
# describe  "PATCH  /tables/:id" do
#   context "update fields" do
#     it "updates name of the table" do
#       put  "/tables/#{table.id}", headers: headers
#       expect(response).to have_http_status(:ok)
#     end
#     it "cannot update table" do
#       put "/tables/1", headers: headers
#       expect(response).to have_http_status(:not_found)
#     end
#   end
# end
# describe "GET '/tables/:id'" do

#     context "display 1 table" do
#         it "displays table name" do
#             get "/tables/#{table.id}", headers: headers
#             expect(response).to have_http_status(:found)
#         end
#         it "shows invalid table id" do
#             get "/tables/1", headers: headers
#             expect(response).to have_http_status(:not_found)
#         end
#     end
# end

# describe " DELETE '/tables/:id' " do
#   context "delete 1 data" do

#     it "delete present data" do
#       delete "/tables/#{table.id}", headers: headers
#       expect(response).to have_http_status(:ok)
#     end

#     it "cannot find and delete" do
#       delete "/tables/1", headers: headers
#       expect(response).to have_http_status(:not_found)
#     end

#   end
# end

#end