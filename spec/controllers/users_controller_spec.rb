require 'spec_helper'

describe UsersController do
  render_views

  before(:each) do
    @base_title = "Track Database"
  end

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end

    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id => @user.id
      response.should have_selector('title',
                                    :content => @base_title +" | " + @user.name)
    end

    it "should have the right title" do
      get :show, :id => @user.id
      response.should have_selector('h1',
                                    :content => @user.name)
    end
  end

  describe "GET 'new'" do

    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title",
                                    :content => @base_title + " | Sign up")
    end
  end
end

