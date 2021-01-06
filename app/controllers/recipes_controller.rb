class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end

    def create
        recipe = Recipe.new(recipe_params)

        if recipe.save
            redirect_to recipes_path
        else
            render :new
        end

    end

    def index
        @recipes = Recipe.all
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[])
    end

end
