require 'csv'

class BaseRepository
  # share the rest of the methods to the subclasses
  def initialize(file_path, model)
    @elements = [] # switch the name to make it more flexible
    @file_path = file_path
    @next_id = 1
    @model = model

    parse_csv if File.exist?(@file_path)
  end

  def all
    @elements
  end

  def find(given_id)
    @elements.find do |element|
      element.id == given_id
    end
  end

  def create(new_instance)
    # build the memory, no diff than before
    # just change the variable name
    new_instance.id = @next_id
    @elements << new_instance
    
    # persist it
    store_csv
    @next_id += 1
  end

  private

  def store_csv
    CSV.open(@file_path, 'wb') do |csv|
      # ask the class to build the header --> see Customer/Meal.rb
      csv << @model.build_header
      @elements.each do |instance|
        csv << instance.build_data # ask the instance to build the data --> see Customer/Meal.rb
      end
    end
  end

  def parse_csv
    csv_options = {
      headers: true,
      header_converters: :symbol
    }

    CSV.foreach(@file_path, csv_options) do |row|
      # we need to call the format method to get a correct row
      formatted_row = @model.format(row)
      # we need to create instance based on the formatted row
      @elements << @model.new(formatted_row)
    end

    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end
end