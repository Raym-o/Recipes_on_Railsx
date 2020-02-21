# frozen_string_literal: true

Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'welcome/index'

  root 'welcome#index'
end
