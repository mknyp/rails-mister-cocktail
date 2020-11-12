# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_serialized = open(url).read
ingredients = JSON.parse(list_serialized)
list = ingredients["drinks"]
puts "Cleaning database..."
Ingredient.destroy_all
sleep 1
puts "Creating data..."
list.each do |ingredient|
  zutat = Ingredient.new(name: ingredient["strIngredient1"])
  zutat.save
end
sleep 2
puts "Finished! #{Ingredient.count} - ingredients created"
puts "getting cocktail names..."
url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'
list_serialized = open(url).read
ingredients = JSON.parse(list_serialized)
name = ingredients["drinks"]
puts "Cleaning database..."
Cocktail.destroy_all
sleep 1
puts "Creating data..."
name.each do |ingredient|
  Cocktail.create!(name: ingredient["strDrink"])
end
sleep 2
puts "Finished! #{Cocktail.count} - cocktails created"
