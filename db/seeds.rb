# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "json"

puts "starting seed"

url = "https://www.googleapis.com/books/v1/users/102817767719508217692/bookshelves/0/volumes?key=AIzaSyB2JkrpLAnGFV2hqVXiJAYSdMwv6hqSFKA"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)
books = user["items"]

books.each do |book|
 Book.create(title: book["volumeInfo"]["title"], author: book["volumeInfo"]["authors"],
description: book["volumeInfo"]["description"],
photo_url: book["volumeInfo"]["imageLinks"]["thumbnail"])
end

puts "ending seed"
