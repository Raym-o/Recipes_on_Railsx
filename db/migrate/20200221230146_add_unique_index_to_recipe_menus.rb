# frozen_string_literal: true

class AddUniqueIndexToRecipeMenus < ActiveRecord::Migration[6.0]
  def change
    add_index :recipe_menus, %i[menu_id recipe_id], unique: true
  end
end
