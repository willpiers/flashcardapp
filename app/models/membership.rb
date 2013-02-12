class Membership < ActiveRecord::Base
  attr_accessible :group_id, :person_id

  validates_uniqueness_of :group_id, :scope => [:person_id], message: "- That person is already in that group"

  validates_presence_of :group_id, :person_id

  belongs_to :person
  belongs_to :group

end
