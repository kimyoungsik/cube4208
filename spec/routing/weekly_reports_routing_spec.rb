require "spec_helper"

describe WeeklyReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/weekly_reports").should route_to("weekly_reports#index")
    end

    it "routes to #new" do
      get("/weekly_reports/new").should route_to("weekly_reports#new")
    end

    it "routes to #show" do
      get("/weekly_reports/1").should route_to("weekly_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/weekly_reports/1/edit").should route_to("weekly_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/weekly_reports").should route_to("weekly_reports#create")
    end

    it "routes to #update" do
      put("/weekly_reports/1").should route_to("weekly_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/weekly_reports/1").should route_to("weekly_reports#destroy", :id => "1")
    end

  end
end
