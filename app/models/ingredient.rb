# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :foodgroup

  validates :name, presence: true
  validates :name, uniqueness: true
end
