require "spec_helper"

describe TravelExpenseReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/travel_expense_reports").should route_to("travel_expense_reports#index")
    end

    it "routes to #new" do
      get("/travel_expense_reports/new").should route_to("travel_expense_reports#new")
    end

    it "routes to #show" do
      get("/travel_expense_reports/1").should route_to("travel_expense_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/travel_expense_reports/1/edit").should route_to("travel_expense_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/travel_expense_reports").should route_to("travel_expense_reports#create")
    end

    it "routes to #update" do
      put("/travel_expense_reports/1").should route_to("travel_expense_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/travel_expense_reports/1").should route_to("travel_expense_reports#destroy", :id => "1")
    end

  end
end
