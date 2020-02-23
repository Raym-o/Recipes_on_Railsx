# frozen_string_literal: true

require 'rest-client'

Page.destroy_all
RecipeIngredient.destroy_all
RecipeMenu.destroy_all
Recipe.destroy_all
Menu.destroy_all
Ingredient.destroy_all
Foodgroup.destroy_all

FOOD_GROUPS = [
  { name: 'Vegetables', suggested_serving: '2 to 3 cups' },
  { name: 'Fruits', suggested_serving: '1.5 to 2 cups' },
  { name: 'Grains', suggested_serving: '5 to 8 ounces' },
  { name: 'Dairy', suggested_serving: '3 cups fat-free or low fat' },
  { name: 'Protein', suggested_serving: '5 to 6.5 ounces' },
  { name: 'Oils', suggested_serving: '5 to 7 teaspoons' }
].freeze

FOOD_GROUPS.each do |food|
  Foodgroup.create(name: food[:name], suggested_serving: food[:suggested_serving])
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
      Ingredient.create(name: index, foodgroup: foodgrp)
      ing = Ingredient.find_by_name(index)
      RecipeIngredient.create(recipe: rec, ingredient: ing) unless ing.nil?
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

Page.create(title: 'About', content: 'Fill this in.', permalink: 'about_us')

puts "Created #{Recipe.count} Recipes"
puts "Created #{Ingredient.count} Ingredients"
puts "Created #{Menu.count} Menus"
puts "Created #{Foodgroup.count} Foodgroups"
puts "Created #{RecipeIngredient.count} RecipeIngredients"
puts "Created #{RecipeMenu.count} RecipeMenus"
