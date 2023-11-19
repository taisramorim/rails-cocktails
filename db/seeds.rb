# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'

json_file = Rails.root.join('db', 'seeds_data', 'ingredients.json')
ingredients_data = JSON.parse(File.read(json_file))

ingredients_data['drinks'].each do |ingredient_data|
  Ingredient.create(name: ingredient_data['strIngredient1'])
end

puts 'Ingredients seeded successfully!'
