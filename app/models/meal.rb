class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(props = {})
    @id = props[:id]
    @name = props[:name]
    @price = props[:price]
  end

  def build_data
    [@id, @name, @price]
  end
  
  def self.build_header
    ['id', 'name', 'price']
  end
  
  def self.format(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    row
  end
end