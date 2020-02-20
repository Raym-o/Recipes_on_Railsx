# frozen_string_literal: true

require 'rest-client'

RecipeIngredient.destroy_all
RecipeMenu.destroy_all
Recipe.destroy_all
Menu.destroy_all
Ingredient.destroy_all
Foodgroup.destroy_all

FOOD_GROUPS = [
  { name: 'vegetables', suggested_serving: '2 to 3 cups' },
  { name: 'fruits', suggested_serving: '1.5 to 2 cups' },
  { name: 'grains', suggested_serving: '5 to 8 ounces' },
  { name: 'dairy', suggested_serving: '3 cups fat-free or low fat' },
  { name: 'protein', suggested_serving: '5 to 6.5 ounces' },
  { name: 'oils', suggested_serving: '5 to 7 teaspoons' }
].freeze

FOOD_GROUPS.each do |food|
  Foodgroup.create(name: food[:name], suggested_serving: food[:suggested_daily_intake])
end

20.times do
  page_counter = rand(50..100)
  request = RestClient.get("http://www.recipepuppy.com/api/?p=#{page_counter}")
  response = JSON.parse(request)
  data = response['results']

  foodgrp = Foodgroup.first
  data.each do |datum|
    rec = Recipe.create(name: datum['title'], description: datum['ingredients'])
    array = datum['ingredients'].split(', ')
    array.each do |index|
      ing = Ingredient.create(name: index, foodgroup: foodgrp)
      RecipeIngredient.create(recipe: rec, ingredient: ing) unless ing.id.nil?
    end
  end
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

default_menu = Menu.where(name: 'General').first
Menu.all.each do |mnu|
  all_recipes = Recipe.all
  all_recipes.each do |rcp|
    if rcp.name.include?(mnu.name)
      current_menu = Menu.find(mnu[:id])
      RecipeMenu.create(recipe: rcp, menu: current_menu)
    else
      RecipeMenu.create(recipe: rcp, menu: default_menu)
    end
  end
end

puts "Created #{Recipe.count} Recipes"
puts "Created #{Ingredient.count} Ingredients"
puts "Created #{Menu.count} Menus"
puts "Created #{Foodgroup.count} Foodgroups"
puts "Created #{RecipeIngredient.count} RecipeIngredients"
puts "Created #{RecipeMenu.count} RecipeMenus"
