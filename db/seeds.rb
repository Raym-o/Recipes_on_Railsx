# frozen_string_literal: true

require 'rest-client'

Recipe.destroy_all
Menu.destroy_all

counter = 20
counter.times do
  page_counter = rand(50..100)
  request = RestClient.get("http://www.recipepuppy.com/api/?p=#{page_counter}")
  response = JSON.parse(request)
  data = response['results']

  data.each do |datum|
    Recipe.create(name: datum['title'], description: datum['ingredients'])
  end
  page_counter += 1
end

MENUS = [
  { name: 'Pasta', description: 'A delightful assortment of pasta dishes from around the world.' },
  { name: 'Chicken', description: 'Chicken dishes of every variety.' },
  { name: 'Beverage', description: 'A variety of beverages, alcoholic and otherwise.' },
  { name: 'Salad', description: 'The green stuff you feel guilty for avoiding.' },
  { name: 'General', description: 'The assortment of stuff that didn\'t get caught by keywords for sorting.' }
].freeze

MENUS.each do |mnu|
  Menu.create(name: mnu[:name], description: mnu[:description])
end

# MENUS.each do |mnu|
#   all_recipes = Recipe.all
#   all_recipes.each do |rcp|
#     RecipeMenu.create(rcp[:id], mnu[:id]) if rcp[:name].include? mnu[:name]
#   end
# end

puts Menu.first.inspect
puts Recipe.first.inspect
