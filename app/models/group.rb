class Group < ActiveRecord::Base
  attr_accessible :name, :photo_url

  has_many :memberships, dependent: :destroy
  has_many :people, through: :memberships
end
