# Please copy/paste all three classes into this file to submit your solution!
class Article
attr_accessor :title, :description, :url, :contributor, :time_published
@@all = []

def initialize(title, description, url, contributor, time_published)
  @title = title
  @description = description
  @url = url
  @contributor = contributor
  @time_published = time_published
  @@all << self
end

def self.all
  @@all
end

def self.find_all_by(category)
  Adapter.all.select do |cat|
    cat.articles == self

  end
end
  #takes category as argument and returns all articles associated with that category
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



def self.find_by_name(cat_name)
  Category.all.find do |category|
    category.name.downcase == cat_name.downcase
  end
end

def self.create_by_name(cat_name)
  Category.new(cat_name)
end

def self.find_or_create(cat_name)
#takes in one argument, string of cat name,
#create a new instance of category, or return existing cat instance
if self.find_by_name(cat_name)
  cat_name
else
  self.create_by_name(cat_name)
end
end



def articles
  Adapter.all.select do |articles|
    articles.category == self
  end
end

  def self.top_category
  #return category with most articles associated
    Category.all.max_by do |category|
      category.articles.count
    end
  end


end




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
