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
