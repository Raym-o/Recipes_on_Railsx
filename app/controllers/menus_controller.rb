# frozen_string_literal: true

class MenusController < ApplicationController
  def index
    @menus = if params[:recipe_id]
               Menu.joins(:recipe_menus).where("menus.id = recipe_menus.menu_id AND recipe_menus.recipe_id = #{params[:recipe_id]}")
             else
               Menu.all
             end
  end

  def show
    @menu = Menu.find(params[:id])
  end
end
