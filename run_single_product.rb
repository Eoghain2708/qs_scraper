require_relative 'scrapers/travis_perkins'
require_relative 'scrapers/b_and_q'
require_relative 'scrapers/haldane_fisher'
require_relative 'run_single_product'
require_relative 'run_list'


class RunSingleProduct
def self.search(scrapers, prompt) 
  item = prompt.ask("What is the item you're looking for?")

  products = scrapers.flat_map {|scraper| scraper.search(item)}
            .compact

  filtered = products.map do |product|
    score = item.downcase.split.count do |word|
      product.name.downcase.include?(word)
    end

    [product, score]
  end

  ranked = filtered.select {|_, score| score > 0}
  best = ranked.sort_by do |product, score|
      [-score, product.price]
    end
  
  best.each do |product, score|
    puts product.to_s
  end
end
end



