class RunList
def self.generate_shopping_list(scrapers, prompt) 
  items = []
  loop do
    input = prompt.ask("Add an item to your shopping list. Type 'done' to finish")

    if input == "done"
      break
    end

    items.append(input)
  end

  current_shopping_list = []
  items.each do |item|
    item_list = scrapers.flat_map do |scraper|
      scraper.search(item)
    end.compact

    ranked = item_list.map do |product|
      score = item.downcase.split.count do |word|
        product.name.downcase.include?(word)
      end

      [product, score]
    end

    ranked = ranked.select { |_, score| score > 0 }

    best = ranked.sort_by do |product, score|
      [-score, product.price]
    end.first

    if best
      current_shopping_list << best[0]
    else
      puts "No results found for #{item}"
    end
  end
  puts "Your current shopping list"
  total_price = 0
  current_shopping_list.each do |item|
    puts item.to_s
    total_price += item.price
  end
  puts "£#{total_price}"
end
end