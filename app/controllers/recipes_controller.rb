# frozen_string_literal: true

class RecipesController < ApplicationController
  # GET /
  def index
    @recipes = Recipe.includes(:menus).order(:name)
  end

  #
  # GET /recipes/:id
  def show
    @recipe = Recipe.find(params[:id])
  end
end
