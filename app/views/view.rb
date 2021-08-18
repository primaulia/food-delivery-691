class View
  def ask_for(label)
    puts "What's the #{label}?"
    gets.chomp
  end

  def ask_for_int(label)
    puts "What's the #{label}?"
    gets.chomp.to_i
  end

  def display_meals(all_meals)
    all_meals.each_with_index do |meal, index|
      puts "#{index + 1}) #{meal.name} - $#{meal.price}"
    end
  end

  def display_customers(all_customers)
    all_customers.each_with_index do |customer, index|
      puts "#{index + 1}) #{customer.name} - #{customer.address}"
    end
  end
end