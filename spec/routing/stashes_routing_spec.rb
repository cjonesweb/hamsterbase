require "spec_helper"

describe StashesController do
  describe "routing" do

    it "routes to #index" do
      get("/stashes").should route_to("stashes#index")
    end

    it "routes to #new" do
      get("/stashes/new").should route_to("stashes#new")
    end

    it "routes to #show" do
      get("/stashes/1").should route_to("stashes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stashes/1/edit").should route_to("stashes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stashes").should route_to("stashes#create")
    end

    it "routes to #update" do
      put("/stashes/1").should route_to("stashes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stashes/1").should route_to("stashes#destroy", :id => "1")
    end

  end
end
