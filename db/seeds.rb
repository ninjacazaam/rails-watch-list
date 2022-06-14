require 'open-uri'
require 'json'

puts "Clearing Movies database..."
Movie.destroy_all
puts "Movies database destroyed"
puts "Generating new Movies database"

# 40.times do
#   movie = Movie.create!(
#     title: Faker::Movie.unique.title,
#     overview: Faker::Lorem.paragraph,
#     poster_url: Faker::LoremFlickr.image(search_terms: ['movies']),
#     rating: rand(0..10)
#   )
#   puts "Added: #{movie.id}. #{movie.title}!"
# end


url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
# p movies["results"][1..5]


movies["results"][1..20].each do |movie|
  new_movie = Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}",
    rating: rand(0..10)
  )
  puts "Added: #{new_movie.id}. #{new_movie.title}!"
end
