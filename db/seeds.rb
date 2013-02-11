# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


groups = [
  { :name => "Starter League Design", :photo_url => "http://www.starterleague.com/assets/logo.png" },
]

Group.destroy_all
groups.each do |group_hash|
  m = Group.new
  m.name = group_hash[:name]
  m.photo_url = group_hash[:photo_url]
  m.save
end

people = [
  { name: "Pedro Carmo", twitter: "drocarmo" },
  { name: "Akiwumi Attawia", twitter: "aattawia" },
  { name: "Alexis Finch", twitter: "agentfin" },
  { name: "Andrew Kelly", twitter: "kellyajkelly" },
  { name: "Anticio Duke", twitter: "onlyaduke" },
  { name: "Benjamin Millstein", twitter: "benmillstein" },
  { name: "Bryan Sebastian", twitter: "bjsebastian" },
  { name: "Caity Moran", twitter: "caitymoran" },
  { name: "Christopher Lindsey", twitter: "ChrisEar2Ground" },
  { name: "Damien Delabesse", twitter: "" },
  { name: "Dan Manges", twitter: "dan_manges" },
  { name: "Elizabeth Park", twitter: "" },
  { name: "Golnaz (Golli) Hashemian", twitter: "golgolli" },
  { name: "Jim Turner", twitter: "_jeturner" },
  { name: "Julia Fedor", twitter: "juliafedor" },
  { name: "Kai Yao", twitter: "ohkaiby" }
]

Person.destroy_all
Membership.destroy_all
people.each do |person_hash|
  d = Person.new
  d.name = person_hash[:name]
  d.twitter = person_hash[:twitter]
  d.photo_url = person_hash[:photo_url]
  name_pieces = d.name.split(' ')
  url_name_string = ""
  name_pieces.each do |piece|
  	url_name_string << "#{piece.downcase}-"
  end
  d.photo_url = "http://portal.starterleague.com/assets/" + url_name_string[0..-2] + ".jpg"
  d.save

  m = Membership.new
  m.group_id = Group.first.id
  m.person_id = d.id
  m.save
end


