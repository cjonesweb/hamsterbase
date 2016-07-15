require "spec_helper"

describe MetadataController do
  describe "routing" do

    it "routes to #index" do
      get("/metadata").should route_to("metadata#index")
    end

    it "routes to #new" do
      get("/metadata/new").should route_to("metadata#new")
    end

    it "routes to #show" do
      get("/metadata/1").should route_to("metadata#show", :id => "1")
    end

    it "routes to #edit" do
      get("/metadata/1/edit").should route_to("metadata#edit", :id => "1")
    end

    it "routes to #create" do
      post("/metadata").should route_to("metadata#create")
    end

    it "routes to #update" do
      put("/metadata/1").should route_to("metadata#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/metadata/1").should route_to("metadata#destroy", :id => "1")
    end

  end
end
