# frozen_string_literal: true

Rails.application.routes.draw do
  # GET /ingredients/ => ingredients#index
  get 'ingredients/index'

  # GET /ingredients/1 => ingredients#show
  get 'ingredients/:id', to: 'ingredients#show', id: /\d+/

  # GET /menus/ => menus#index
  get 'menus/index'

  # GET /menus/1 => menus#show
  get 'menus/:id', to: 'menus#show', id: /\d+/

  # GET /foodgroups/ => foodgroups#index
  get 'foodgroups/index'

  # GET /foodgroups/1 => foodgroups#show
  get 'foodgroups/:id', to: 'foodgroups#show', id: /\d+/

  # GET /recipes/ => recipes#index
  get 'recipes/index'

  # GET /recipes/1 => recipes#show
  get 'recipes/:id', to: 'recipes#show', id: /\d+/

  # GET / => welcome#show
  root 'welcome#index'
end
