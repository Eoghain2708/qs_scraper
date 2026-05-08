require_relative 'scrapers/travis_perkins'
require_relative 'scrapers/b_and_q_scraper'

scrapers = [
  TravisPerkins.new,
  BNQScraper.new
]


scrapers.each do |scraper|
  scraper.search('47mm timber')
end

