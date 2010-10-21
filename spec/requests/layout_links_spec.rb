require 'spec_helper'

describe "ClickLinks"do

  before(:each) do
    @base_title = "Track Database"
  end

  it "should respond to clicks in the right way" do
    visit root_path
    click_link "Help"
      response.should have_selector('title',
                                    :content => @base_title +" | Help")
    click_link "Sign up"
      response.should have_selector('title',
                                    :content => @base_title +" | Sign up")
    click_link "About"
      response.should have_selector('title',
                                    :content => @base_title +" | About")
    click_link "Contact"
      response.should have_selector('title',
                                    :content => @base_title +" | Contact")
    end
end

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

