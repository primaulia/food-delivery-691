class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(props = {})
    @id = props[:id]
    @name = props[:name]
    @address = props[:address]
  end
  
  def build_data
    [@id, @name, @address]
  end

  def self.build_header
    ['id', 'name', 'address']
  end

  def self.format(row)
    row[:id] = row[:id].to_i
    row
  end
end