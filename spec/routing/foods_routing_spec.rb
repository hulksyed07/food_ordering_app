require "rails_helper"

RSpec.describe FoodsController, type: :routing do
  describe "routing" do

    it "routes to #add_to_cart" do
      expect(:post => "/categories/1/foods/1/add_to_cart").to route_to("foods#add_to_cart", :id => '1', :category_id => '1')
    end

    it "routes to #remove_from_cart" do
      expect(:post => "/categories/1/foods/1/remove_from_cart").to route_to("foods#remove_from_cart", :id => '1', :category_id => '1')
    end

    it "routes to #new" do
      expect(:get => "/categories/1/foods/new").to route_to("foods#new", :category_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/categories/1/foods/1").to route_to("foods#show", :id => "1", :category_id => '1')
    end

    it "routes to #edit" do
      expect(:get => "/categories/1/foods/1/edit").to route_to("foods#edit", :id => "1", :category_id => '1')
    end

    it "routes to #create" do
      expect(:post => "/categories/1/foods").to route_to("foods#create", :category_id => '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/categories/1/foods/1").to route_to("foods#update", :id => "1", :category_id => '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/categories/1/foods/1").to route_to("foods#update", :id => "1", :category_id => '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/categories/1/foods/1").to route_to("foods#destroy", :id => "1", :category_id => '1')
    end

  end
end
