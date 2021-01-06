class IngredientsController < ApplicationController

    def new
        @ingredient = Ingredient.new
    end

    def create
        ingredient = Ingredient.new(ingredient_params)

        if ingredient.save
            redirect_to ingredients_path
        else
            render :new
        end

    end

    def index
        @ingredients = Ingredient.all
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        
        @ingredient.update(ingredient_params)

        if @ingredient.save
            redirect_to ingredients_path
        else
            render :edit
        end

    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
