require "nokogiri"
require "open-uri"

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
        rating = @view.rating_recipe
        prep_time = @view.prep_time
        recipe = Recipe.new(name, description, rating, prep_time)
        @cookbook.add_recipe(recipe)
    end

    def destroy 
        list
        @cookbook.remove_recipe(@view.get_index)    
    end

    def import
       suggested_recipes = []
       user_ingredient = @view.which_ingredient
       url = "https://www.allrecipes.com/search/results/?search=#{user_ingredient}"
       
       html = URI.open(url).read
       doc = Nokogiri::HTML(html)

       doc.search(".card__detailsContainer").first(5).each do |card|
            title = card.search(".card__title").text.strip
            description = card.search(".card__summary").text.strip
            rating = card.search(".review-star-text").text.strip.split(" ")[1]
            
            url_link = card.search(".card__titleLink")[0].attribute("href")
            html_link = URI.open(url_link).read
            doc_link = Nokogiri::HTML(html_link)
            prep_time = doc_link.search(".recipe-meta-item-body")[0].text.strip
            
            suggested_recipes << Recipe.new(title, description, rating, prep_time)
       end

       @view.display(suggested_recipes)

       user_choice = @view.choose_imported_ingredient

       @cookbook.add_recipe(suggested_recipes[user_choice])
       
       @view.display(@cookbook.all)
    end

    def mark
        list
        user_choice = @view.what_to_mark
        array = @cookbook.all
        array[user_choice].mark = true
        
        @cookbook.save_csv
        list
    end
end