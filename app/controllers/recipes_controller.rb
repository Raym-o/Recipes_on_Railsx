# frozen_string_literal: true

class RecipesController < ApplicationController
  # GET /
  def index
    @recipes = Recipe.includes(:menus).order(:name)
  end

  # GET /search/?search_term=user+search+terms
  def search
    @recipes = Recipe.where('name LIKE ?', "%#{params[:search_term]}%")
  end

  # GET /recipes/:id
  def show
    @recipe = Recipe.find(params[:id])
  end
end
