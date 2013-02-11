class Person < ActiveRecord::Base
  attr_accessible :name, :twitter, :photo_url

  validates_presence_of :name

  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships
end
