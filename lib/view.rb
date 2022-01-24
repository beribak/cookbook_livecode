class View

    def display(array)
        array.each_with_index do |object, index|
            
            if object.mark == "true"
                box = "[X]"
            else
                box = "[ ]"
            end

            puts "#{box}  #{index + 1} -- #{object.name} -- #{object.prep_time}  (#{object.rating}/5)"
        end
    end

    def name_recipe
        p "Recipe name pls:"
        gets.chomp
    end

    def description_recipe
        p "Description name pls:"
        gets.chomp
    end

    def rating_recipe
        p "Recipe rating pls:"
        gets.chomp
    end

    def prep_time
        p "Recipe prep time pls:"
        gets.chomp
    end

    def get_index
        p "What recipe do you want to delete"
        gets.chomp.to_i - 1
    end

    def what_to_mark
        p "What recipe do you want to mark"
        gets.chomp.to_i - 1
    end

    def which_ingredient
        puts "What ingredient would you like a recipe for?"
        gets.chomp
    end

    def choose_imported_ingredient
        p "Which recipe would you like to import? (enter index)"
        gets.chomp.to_i - 1
    end
end