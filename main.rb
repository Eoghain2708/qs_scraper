require_relative 'scrapers/travis_perkins'
require_relative 'scrapers/b_and_q'
require_relative 'scrapers/haldane_fisher'

scrapers = [
  TravisPerkins.new,
  BNQScraper.new,
  HaldaneFisher.new
]
products = [] 
scrapers.each do |scraper|
  data = scraper.search("cement")
  products.concat(data)
end

# products = []
# data = []
# products = [ Product from TP, Product from TP .....
# Product from BNQ, Product from BNQ ......
# Product from HF, Product from HF ......]
#

sorted = products.sort_by(&:price)

puts sorted

