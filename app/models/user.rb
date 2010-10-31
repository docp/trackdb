# == Schema Information
# Schema version: 20101021145404
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :password, :confirmation => true automatically creates virtual
  #attribute password_confirmation which is checked to be maching the password.
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 10..40 }
  validates :name, :presence => true,
                   :length => { :maximum => 32 }
  validates :email, :presence => true,
                    :uniqueness => { :case_sensitive => false },
                    :format => { :with => email_regex }
end

