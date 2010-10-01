require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should load successful" do
      get 'home'
      response.should be_success
    end
#    it "should have the right title" do
#      get 'home'
#      response.should have_selector("title",
#                                    :content => "Track database | Home")
#    end
  end

  describe "GET 'contact'" do
    it "should load successful" do
      get 'contact'
      response.should be_success
    end

#    it "should have the right title" do
#      get 'contact'
#      response.should have_selector("title",
#                      :content => "Track database | Contact")
#    end
      end

  describe "GET 'about'" do
    it "should load successful" do
      get 'about'
      response.should be_success
    end

#    it "should have the right title" do
#      get 'about'
#      response.should have_selector("title",
#                      :content => "Track database | About")
#    end
#    it "should contain written by paul" do
#      get 'about'
#      response.should have_selector("body", :content => "written by paul")
#    end
  end


end

