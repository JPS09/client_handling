# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p 'DB cleaning'
Pack.delete_all
Feature.delete_all
Status.delete_all
Client.delete_all
Type.delete_all

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

p 'Creating 10 Hours Pack'
first_pack = Pack.new(is_valid: true, remaining_hours: 5.5)
first_pack.client = Client.find_by(name: 'Ruby Railies')
first_pack.type = Type.find_by(default_hours: 10)
first_pack.save!

p '10 Hours Pack Created'

p 'Creating 25 Hours Pack'
second_pack = Pack.new(is_valid: true, remaining_hours: 12.3)
second_pack.client = Client.find_by(name: 'Richard Lucas')
second_pack.type = Type.find_by(default_hours: 25)
second_pack.save!

p ' 25 Hours Pack Created'

p 'Creating 50 Hours Pack'
third_pack = Pack.new(is_valid: true, remaining_hours: 28.5)
third_pack.client = Client.find_by(name: 'Hugues Daniel')
third_pack.type = Type.find_by(default_hours: 50)
third_pack.save!

p '50 Hours Pack Created'

p 'Creating first Pack features'

first_pack_features = [{ description: "Ajouter react_on_rails à l'application", cost: 3 },
                       { description: 'Créer des Seeds', cost: 0.5 },
                       { description: 'Ajouter une animation de validation', cost: 1 }]

first_pack_features.each do |fp_status|
  temp = Feature.new(description: fp_status[:description], cost: fp_status[:cost])
  temp.status = Status.order('RANDOM()').limit(1)[0]
  temp.pack = first_pack
  temp.save!
end

p 'First Pack features Created'

p 'Creating second Pack features'
second_pack_features = [{ description: 'Mettre à jour Ruby on Rails', cost: 5 },
                        { description: "Rendre l'application SSO friendly", cost: 2.7 },
                        { description: "Corriger l'affichage sur l'index", cost: 0.5 },
                        { description: 'Enquêter sur problème en prod', cost: 2.5 },
                        { description: "Corriger problème d'injection SQL", cost: 1.5 },
                        { description: 'Effacer les entrées plus anciennes de 2 ans pour RGPD', cost: 0.5 }]

second_pack_features.each do |fp_status|
  temp = Feature.new(description: fp_status[:description], cost: fp_status[:cost])
  temp.status = Status.order('RANDOM()').limit(1)[0]
  temp.pack = second_pack
  temp.save!
end

p 'Second Pack features Created'

p 'Creating third Pack features'
third_pack_features = [{ description: 'Refacto des controlleurs pour meilleure perf', cost: 11 },
                       { description: 'Ajouts infos de contact', cost: 0.1 },
                       { description: "Ajout d'une interface admin", cost: 3 },
                       { description: 'Reinitialiser MDP compte piratés', cost: 1.5 },
                       { description: 'Homogénéiser BDD prod et DEV pour reproduire bug', cost: 2.2 },
                       { description: 'Enquête sur utilisateur ne pouvant se connecter', cost: 1.5 },
                       { description: 'Mettre à jour footer', cost: 0.5 },
                       { description: 'Intégrer formulaire de contact', cost: 1.7 }]

third_pack_features.each do |fp_status|
  temp = Feature.new(description: fp_status[:description], cost: fp_status[:cost])
  temp.status = Status.order('RANDOM()').limit(1)[0]
  temp.pack = third_pack
  temp.save!
end

p 'Third Pack features Created'
