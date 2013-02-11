# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


groups = [
  { :name => "The Dark Knight", :photo_url => "http://www.starterleague.com/assets/logo.png" },
]

Group.destroy_all
groups.each do |group_hash|
  m = Group.new
  m.name = group_hash[:name]
  m.photo_url = group_hash[:photo_url]
  m.save
end

people = [
  { name: "Pedro Carmo", twitter: "drocarmo", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Akiwumi Attawia", twitter: "aattawia", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Alexis Finch", twitter: "agentfin", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Andrew Kelly", twitter: "kellyajkelly", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Anticio Duke", twitter: "onlyaduke", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Benjamin Millstein", twitter: "benmillstein", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Bryan Sebastian", twitter: "bjsebastian", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Caity Moran", twitter: "caitymoran", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Christopher Lindsey", twitter: "ChrisEar2Ground", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Damien Delabesse", twitter: "", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Dan Manges", twitter: "dan_manges", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Elizabeth Park", twitter: "", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Golnaz (Golli) Hashemian", twitter: "golgolli", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Jim Turner", twitter: "_jeturner", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Julia Fedor", twitter: "juliafedor", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" },
  { name: "Kai Yao", twitter: "ohkaiby", photo_url: "http://www.prguitarman.com/comics/poptart1red1.gif" }
]

Person.destroy_all
Membership.destroy_all
people.each do |person_hash|
  d = Person.new
  d.name = person_hash[:name]
  d.twitter = person_hash[:twitter]
  d.photo_url = person_hash[:photo_url]
  d.save

  m = Membership.new
  m.group_id = Group.first.id
  m.person_id = d.id
  m.save
end


