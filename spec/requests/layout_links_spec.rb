require 'spec_helper'

describe "LayoutLinks" do

  before(:each) do
    @base_title = "Track Database"
  end

  it "should have Home page at '/'" do
    get '/'
    response.should have_selector('title',
                                  :content => @base_title + " | Home")
  end

  it "should have contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title',
                                  :content => @base_title +" | Contact")
  end

  it "should have About page at '/about'" do
    get '/about'
    response.should have_selector('title',
                                  :content => @base_title +" | About")
  end

  it "should have Help page at '/help'" do
    get '/help'
    response.should have_selector('title',
                                  :content => @base_title +" | Help")
  end

  it "should have Sign up page at /signup" do
    get '/signup'
    response.should have_selector('title',
                                  :content => @base_title +" | Sign up")
  end
end

