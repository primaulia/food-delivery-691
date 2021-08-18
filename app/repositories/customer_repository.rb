require 'pry-byebug'
require_relative 'base_repository'
require_relative '../models/customer'

class CustomerRepository < BaseRepository
  def initialize(file_path)
    # overwrite the parent repository
    # and pass over the Customer class to the parent
    super(file_path, Customer)
  end
end