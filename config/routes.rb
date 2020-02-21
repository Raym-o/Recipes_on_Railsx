# frozen_string_literal: true

Rails.application.routes.draw do
  get 'ingredients/index'
  get 'ingredients/show'
  get 'menus/index'
  get 'menus/show'
  get 'foodgroups/index'
  get 'foodgroups/show'
  get 'recipes/index'
  get 'recipes/show'
  get 'welcome/index'

  root 'welcome#index'
end
