# frozen_string_literal: true

Rails.application.routes.draw do
  # GET /ingredients/ => ingredients#index
  get 'ingredients/index', as: 'ingredients'

  # GET /ingredients/1 => ingredients#show
  get 'ingredients/:id', to: 'ingredients#show', id: /\d+/, as: 'ingredient'

  # GET /menus/ => menus#index
  get 'menus/index', as: 'menus'

  # GET /menus/1 => menus#show
  get 'menus/:id', to: 'menus#show', id: /\d+/, as: 'menu'

  # GET /foodgroups/ => foodgroups#index
  get 'foodgroups/index', as: 'foodgroups'

  # GET /foodgroups/1 => foodgroups#show
  get 'foodgroups/:id', to: 'foodgroups#show', id: /\d+/, as: 'foodgroup'

  # GET /recipes/ => recipes#index
  get 'recipes/index', as: 'recipes'

  # GET /recipes/1 => recipes#show
  get 'recipes/:id', to: 'recipes#show', id: /\d+/, as: 'recipe'

  # GET / => welcome#show
  root 'welcome#index'
end
