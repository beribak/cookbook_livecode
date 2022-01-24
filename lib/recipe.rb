class Recipe 

    attr_reader :name, :description, :rating, :prep_time
    attr_accessor :mark
    def initialize(name, description, rating, mark = false, prep_time)
      @name = name
      @description = description
      @rating = rating
      @mark = mark
      @prep_time = prep_time
    end


end