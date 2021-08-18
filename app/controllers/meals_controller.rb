require_relative '../views/view'

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @view = View.new
  end

  def add
    name = @view.ask_for('name')
    price = @view.ask_for_int('price')

    new_meal = Meal.new(
      name: name,
      price: price
    )

    @meal_repo.create(new_meal)
  end

  def list
    all_meals = @meal_repo.all
    @view.display_meals(all_meals)
  end
end