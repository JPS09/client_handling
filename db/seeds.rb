# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

statuses = ['En cours de chiffrage', 'Envoyé au client', 'Stand-by', 'Validé par le client', 'Abandonné',
            'En Production']

statuses.each do |status|
  Status.create!(stage: status)
end
