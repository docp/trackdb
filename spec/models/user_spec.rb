require 'spec_helper'

describe User do

    before(:each) do
		@attr = { :name => "Max Mustermann",
		          :email => "max@mustermann.de",
		          :password => "Geheim",
		          :password_confirmation => "Geheim" }
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

  describe "password validation" do


    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation =>"")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
end

