class Category

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def find_or_create(category_name)
    # This method takes in one argument, which is a string of the category name.
    # The method should create a new instance of a category if one doesn't already exist.
    # Otherwise, it should return the existing category instance.
    found = Category.all.find {|c| c.name == category_name}
    if found
      found
    else
      Category.new(category_name)
    end
  end

  def get_articles
    Article.all.select {|a| a.category == self}
  end

  def self.top_category
    # Returns category with the most articles associated with it
    Category.all.sort_by {|c| c.get_articles.count}.last
  end

end
