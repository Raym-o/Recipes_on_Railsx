# frozen_string_literal: true

class FoodgroupsController < ApplicationController
  def index
    @foodgroups = Foodgroup.all
  end

  def show
    @foodgroup = Foodgroup.find(params[:id])
  end
end
