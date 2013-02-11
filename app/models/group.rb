class Group < ActiveRecord::Base
  attr_accessible :name, :photo_url

  validates :photo_url, :format => URI::regexp(%w(http https))

  has_many :memberships, dependent: :destroy
  has_many :people, through: :memberships
end
