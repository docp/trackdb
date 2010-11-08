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

  describe "when not signed in" do

    it "should have a login link" do
      visit root_path
      response.should have_selector('a', :href => login_path,
                                         :content => "Login")
    end

    it "should have a sign up link" do
      visit root_path
      response.should have_selector('a', :href => signup_path,
                                         :content => "Sign up")
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit login_path
      fill_in :email, :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a logout link" do
      visit root_path
      response.should have_selector('a', :href => logout_path,
                                         :content => "Logout")
    end
  end
end

