require 'spec_helper'

describe User do

  before(:each) do
		@attr = { :name => "Max Mustermann", :email => "max@mustermann.de" }
	end

	it "should create new instance given valid attributes" do
		User.create!(@attr)
	end

  it "should require a name" do
  	no_name_user = User.create(@attr.merge(:name => ""))
  	no_name_user.should_not be_valid
  end

  it "should require an email adress" do
  	no_email_user = User.create(@attr.merge(:email => ""))
  	no_email_user.should_not be_valid
  end

  it "should have username shorter than 32 characters" do
    tooloong_name_user = User.create(@attr.merge(:name => "a" * 33))
    tooloong_name_user.should_not be_valid
  end

  it "should reject invalid email adresses" do
    invalid_emails = %w{foo(at)bar.com}
    invalid_emails.each do |iv_e|
      invalid_email_user = User.create(@attr.merge(:email => iv_e))
      invalid_email_user.should_not be_valid
    end
  end

  it "should accept valid email adresses" do
    valid_emails = %w{eins@gmail.com Zwei@YAHOO.DE dRei@rocketmail.com
      VIER@rocketmail.com fuenF@YAHOO.DE se.chs@YAHOO.DE sie_ben@rocketmail.com}
    valid_emails.each do |v_e|
      valid_email_user = User.create(@attr.merge(:email => v_e))
      valid_email_user.should be_valid
    end
  end

  it "should not allow more than one user per email adress" do
    usr = User.create(@attr)
    duplicate_email_usr = User.create(@attr.merge(:name => "Maexchen",
                                               :email => @attr[:email].upcase))
    duplicate_email_usr.should_not be_valid
  end
end

