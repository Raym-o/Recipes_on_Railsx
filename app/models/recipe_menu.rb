# frozen_string_literal: true

class RecipeMenu < ApplicationRecord
  belongs_to :recipe
  belongs_to :menu
end
