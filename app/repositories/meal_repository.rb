require 'pry-byebug'
require_relative 'base_repository'
require_relative '../models/meal'

class MealRepository < BaseRepository
  def initialize(file_path)
    super(file_path, Meal)
  end
end