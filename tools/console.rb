require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

comic = Category.new("Comic")
sports = Category.new("Sports")
headlines = Category.new("Headlines")

westbrook = Article.new("Westbeast wins", "Westbeast description", "www.nytimes/westbrook.com", "OKC", "10:00")
calvinhobbes = Article.new("Calvinball rules", "Calvinball description", "www.nytimes/calvinhobbes.com", "Waterson", "10:15")




Pry.start
