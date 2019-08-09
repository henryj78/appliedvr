class HomeController < ApplicationController
  def index
    #TODO you can limit the recordset e.g.
    # @recipes = Recipe.select(:title).limit(1)
    @recipes = Recipe.all
    render json: @recipes
  end
end
