# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing Movies database..."
Movie.destroy_all
puts "Movies database destroyed"
puts "Generating new Movies database"

40.times do
  movie = Movie.create!(
    title: Faker::Movie.unique.title,
    overview: Faker::Lorem.paragraph,
    poster_url: Faker::LoremFlickr.image(search_terms: ['movies']),
    rating: rand(0..10)
  )
  puts "Added: #{movie.id}. #{movie.title}!"
end
