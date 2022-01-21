class View

    def display(array)
        array.each_with_index do |object, index|
            puts " #{index + 1} -- #{object.name}"
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

    def get_index
        p "What recipe do you want to delete"
        gets.chomp.to_i - 1
    end
end