require "spec_helper"

describe WeekreportsController do
  describe "routing" do

    it "routes to #index" do
      get("/weekreports").should route_to("weekreports#index")
    end

    it "routes to #new" do
      get("/weekreports/new").should route_to("weekreports#new")
    end

    it "routes to #show" do
      get("/weekreports/1").should route_to("weekreports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/weekreports/1/edit").should route_to("weekreports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/weekreports").should route_to("weekreports#create")
    end

    it "routes to #update" do
      put("/weekreports/1").should route_to("weekreports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/weekreports/1").should route_to("weekreports#destroy", :id => "1")
    end

  end
end
