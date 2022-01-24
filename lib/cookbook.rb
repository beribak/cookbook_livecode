require "csv"

class Cookbook
    def initialize(csv_file)
        @recipes = []
        @filepath = csv_file
        CSV.foreach(csv_file) do |row| # row = [sushi, japanese]
            @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4])
        end
    end

    def all
        @recipes
    end

    def add_recipe(recipe) 
        @recipes << recipe
        save_csv
    end

    def remove_recipe(index) 
        @recipes.delete_at(index)
        save_csv
    end

    # private

    def save_csv
        CSV.open(@filepath, "wb") do |csv|
            @recipes.each do |recipe|
                csv << [recipe.name, recipe.description, recipe.rating, recipe.mark, recipe.prep_time]
            end
        end
    end
end