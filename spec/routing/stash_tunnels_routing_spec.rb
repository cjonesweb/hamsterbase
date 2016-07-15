require "spec_helper"

describe StashTunnelsController do
  describe "routing" do

    it "routes to #index" do
      get("/stash_tunnels").should route_to("stash_tunnels#index")
    end

    it "routes to #new" do
      get("/stash_tunnels/new").should route_to("stash_tunnels#new")
    end

    it "routes to #show" do
      get("/stash_tunnels/1").should route_to("stash_tunnels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stash_tunnels/1/edit").should route_to("stash_tunnels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stash_tunnels").should route_to("stash_tunnels#create")
    end

    it "routes to #update" do
      put("/stash_tunnels/1").should route_to("stash_tunnels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stash_tunnels/1").should route_to("stash_tunnels#destroy", :id => "1")
    end

  end
end
