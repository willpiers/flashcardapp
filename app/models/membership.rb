class Membership < ActiveRecord::Base
  attr_accessible :group_id, :person_id

  belongs_to :person
  belongs_to :group
end
