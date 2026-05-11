require_relative 'scrapers/travis_perkins'
require_relative 'scrapers/b_and_q'
require_relative 'scrapers/haldane_fisher'
require_relative 'run_list'
require_relative 'run_single_product'
require "tty-prompt"

PROMPT = TTY::Prompt::new

scrapers = [
  TravisPerkins.new,
  BNQScraper.new,
  HaldaneFisher.new
]

input = PROMPT.select("Search a single item or generate a shopping list?", %w(Item List))
case input
when 'Item'
  RunSingleProduct.search(scrapers, PROMPT)
when 'List'
  RunList.generate_shopping_list(scrapers, PROMPT)
end







