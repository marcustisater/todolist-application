require "spec_helper"

describe TodoitListsController do
  describe "routing" do

    it "routes to #index" do
      get("/todoit_lists").should route_to("todoit_lists#index")
    end

    it "routes to #new" do
      get("/todoit_lists/new").should route_to("todoit_lists#new")
    end

    it "routes to #show" do
      get("/todoit_lists/1").should route_to("todoit_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/todoit_lists/1/edit").should route_to("todoit_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/todoit_lists").should route_to("todoit_lists#create")
    end

    it "routes to #update" do
      put("/todoit_lists/1").should route_to("todoit_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/todoit_lists/1").should route_to("todoit_lists#destroy", :id => "1")
    end

  end
end
