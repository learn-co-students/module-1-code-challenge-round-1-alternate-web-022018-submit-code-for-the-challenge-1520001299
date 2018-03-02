require 'pry'
require 'json'

# In terminal, you should be able to call Adapter.new('newyorker.json').create_objects_from_file and get the created Article objects as a return value

class Adapter
  attr_accessor :file, :articles

  @@all = []

  def initialize(file)
    @file = file
    @articles = self.class.articles(file)
    @@all << self
  end

  def self.all
    @@all
  end

  def self.articles(file)
    JSON.parse(File.read(file))
  end

  def create_objects_from_file
    Adapter.new('newyorker.json').articles.map do |article|
      Category.new(article["category"])
      Article.new(article["title"], article["description"], article["url"], article["contributor"], article["publishedAt"])
    end
       # create article and category objects here
  end

end
