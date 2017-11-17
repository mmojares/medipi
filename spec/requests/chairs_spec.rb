require "rails_helper"

RSpec.describe "table test", :type => :request do
  # headers = {"ACCEPT" => "application/json"}
  # let!(:chair) { create :chair }
  # let!(:table) { create :table }
  # describe "table_chairs get /tables/:table_id/chairs" do
  #   context "index page" do
  #     it "shows the list of chairs" do
  #       get "/tables/#{chair.table.id}/chairs", headers: headers
  #       expect(response).to have_http_status(:ok)
  #     end
  #     it "no list of chairs" do
  #       get "/tables/1/chairs", headers: headers
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end
  # end

  # describe "create chair /tables/:table_id/chairs" do
  #   context "create chairs" do
  #     it "creates chair" do
  #       post "/tables/#{chair.table.id}/chairs", params:{ name_type: "MONO" }, headers: headers
        
  #       expect(response).to have_http_status(:ok)
        
  #     end
  #     it "creates chair with invalid id" do
  #       post "/tables/1/chairs", params: { chair_name: { name_type: "MONO" } }, headers: headers
  #       expect(response).to have_http_status(:bad_request)
  #     end
  #   end
  # end

  # describe "show chair /tables/:table_id/chairs/:id" do
  #   context "show chair" do
  #     it "shows created chair " do
  #       get "/tables/#{chair.table.id}/#{chair.id}", headers: headers
  #       expect(response).to have_http_status(:ok)
  #     end
  #     it "does not show created chair" do
  #       get "/tables/1/1", headers: headers
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end
  # end

  # describe "update chair /tables/:table_id/chairs/:id" do
  #   context "update chair" do
  #     it "update chair attributes" do
  #      patch "/table/#{chair.table.id}/chairs/#{chair.id}", headers: headers
  #      expect(response).to have_http_status(:ok)
  #     end
  #     it "does not update chair attributes" do
  #       patch "/table/1/chairs/1", headers: headers
  #       expect(response).to have_http_status(:not_found)
  #     end
  #   end
  # end

  # describe "delete chair /tables/:table_id/chairs/:id" do
  #   context "delete a chair" do
  #     it "deletes a chair" do
  #       delete "tables/#{chair.table.id}/chairs/#{chair.id}", headers: headers
  #       expect(response).to have_http_status(:ok)
  #     end

  #     it "cannot delete chair" do
  #       delete "tables/1/chairs/1", headers: headers
  #       expect(response).to have_http_status(:not_found)
  #     end
  #   end
  # end
end

