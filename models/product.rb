class Product
  attr_accessor :name, :price, :url, :merchant, :review

  def initialize(name:, price:, url:, merchant:, review:)
    @name = name
    @price = price
    @url = url
    @merchant = merchant
    @review = review || { rating: 0.0, count: 0 }
  end

  def to_s
  <<~TEXT
  -----------------------------------
  #{name}
  #{price}
  ⭐ Average Rating: #{review[:rating]} out of #{review[:count]} ratings
  #{merchant}
  #{url}
  TEXT
  end
end
