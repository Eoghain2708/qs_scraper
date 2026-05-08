require_relative 'scrapers/travis_perkins'

query = gets.chomp

scraper = TravisPerkins.new
products = scraper.search(query)

sorted_by_price = products.sort_by(&:price).reverse

sorted_by_reviews = products.sort_by {|p| p.review[:rating].to_f }.reverse

puts "\nProducts matching '#{query}':\n\n"

sorted_by_price.each do |product|
  puts product.to_s
end