# Please copy/paste all three classes into this file to submit your solution!
class Article

  attr_accessor :title, :description, :url, :contributor, :publishedAt

  @@all = []

  def initialize(contributor, title, description, url, publishedAt)
    @title = title
    @description = description
    @url = url
    @contributor = contributor
    @publishedAt = publishedAt
    @@all << self
  end

  def self.all
    @@all
  end

  def add_category(category)
    self.category = category
  end

  def self.find_all_by_category(category)
    # Takes a category instance as an argument, and returns all articles associated
    # with that category

    # categories = Category.all.select {|c| c == category}
    Article.all.select {|a| a.category = category}
  end

end

require 'pry'
require 'json'

# In terminal, you should be able to call Adapter.new('newyorker.json').create_objects_from_file
# and get the created Article objects as a return value

class Adapter
  attr_accessor :file, :articles

  def initialize(file)
    @file = file
    @articles = self.class.articles(file)
  end

  def self.articles(file)
    JSON.parse(File.read(file))
  end

  def create_objects_from_file
    # create article and category objects here
    # This method should use the provided articles data to create Article and Category
    # objects. It should return the created instances.
    Adapter.articles(file).map do |a|
      Article.new(a["contributor"], a["title"], a["description"], a["url"], a["publishedAt"])
      Category.new(a["category"])
    end

  end

end

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
