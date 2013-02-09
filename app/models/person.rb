class Person < ActiveRecord::Base
  attr_accessible :name, :twitter, :photo_url

  has_many :memberships
  has_many :groups, through: :memberships
end
