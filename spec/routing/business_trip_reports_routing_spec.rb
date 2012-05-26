require "spec_helper"

describe BusinessTripReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/business_trip_reports").should route_to("business_trip_reports#index")
    end

    it "routes to #new" do
      get("/business_trip_reports/new").should route_to("business_trip_reports#new")
    end

    it "routes to #show" do
      get("/business_trip_reports/1").should route_to("business_trip_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/business_trip_reports/1/edit").should route_to("business_trip_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/business_trip_reports").should route_to("business_trip_reports#create")
    end

    it "routes to #update" do
      put("/business_trip_reports/1").should route_to("business_trip_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/business_trip_reports/1").should route_to("business_trip_reports#destroy", :id => "1")
    end

  end
end
