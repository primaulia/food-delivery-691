require_relative '../views/view'

class CustomersController
  def initialize(customer_repo)
    @customer_repo = customer_repo
    @view = View.new
  end

  def add
    name = @view.ask_for('name')
    address = @view.ask_for('address')

    new_customer = Customer.new(
      name: name,
      address: address
    )

    @customer_repo.create(new_customer)
  end

  def list
    all_customers = @customer_repo.all
    @view.display_customers(all_customers)
  end
end