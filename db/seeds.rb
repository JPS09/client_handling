# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p 'DB cleaning'
Status.delete_all
Client.delete_all
Feature.delete_all
Pack.delete_all

statuses = ['En cours de chiffrage', 'Envoyé au client', 'Stand-by', 'Validé par le client', 'Abandonné',
            'En Production']

p 'Creating statuses'
statuses.each do |status|
  Status.create!(stage: status)
end

p 'Statuses Created'

clients = [{ name: 'Ruby Railies', address: '98, impasse Olivier Boucher', phone_number: '+33317697132' },
           { name: 'Richard Lucas', address: '16, rue Maillet', phone_number: '+33620426696' },
           { name: 'Hugues Daniel', address: '49, rue Andre', phone_number: '+33637496208' }]

p 'Creating Clients'
clients.each do |client|
  Client.create!(name: client[:name], address: client[:address], phone_number: client[:phone_number])
end

p 'Clients Created'

types = [{ name: '10 Hours Package', default_hours: 10 }, { name: '25 Hours Package', default_hours: 25 },
         { name: '50 Hours Package', default_hours: 50 }]

p 'Creating Types'

types.each do |type|
  Type.create!(name: type[:name], default_hours: type[:default_hours])
end

p 'Types Created'

p 'Creating Packs'

@packs = [{ is_valid: true, remaining_hours: 5.5 }, { is_valid: true, remaining_hours: 12.3 },
          { is_valid: true, remaining_hours: 38.6 }]

# @packs.each do |pack|
#   temp = Pack.new(is_valid: pack[:is_valid], remaining_hours: pack[:remaining_hours])
#   temp.type = Type.find
# end
