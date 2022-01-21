require_relative "view"
require_relative "recipe"

class Controller 

    def initialize(cookbook)
        @cookbook = cookbook        
        @view = View.new
    end

    def list
        @view.display(@cookbook.all)
    end

    def create
        name = @view.name_recipe
        description = @view.description_recipe
        recipe = Recipe.new(name, description)
        @cookbook.add_recipe(recipe)
    end

    def destroy 
        list
        @cookbook.remove_recipe(@view.get_index)    
    end
end