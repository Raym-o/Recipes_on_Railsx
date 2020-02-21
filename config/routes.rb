# frozen_string_literal: true

Rails.application.routes.draw do
  get 'ingredients/index'
  get 'ingredients/show'
  get 'menus/index'
  get 'menus/show'
  get 'foodgroups/index'
  get 'foodgroups/show'

  # GET / => recipes#index
  get 'recipes/index'

  get 'recipes/:id', to: 'recipes#show', id: /\d+/

  root 'welcome#index'
end
