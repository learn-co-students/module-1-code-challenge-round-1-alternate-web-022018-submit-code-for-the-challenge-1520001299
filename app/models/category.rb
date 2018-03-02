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
