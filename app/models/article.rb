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
