require_relative('../db/sql_runner.rb')

class Screening

  attr_accessor :screen_time

  def initialize(options)
    @screen_time = options('screen_time').to_i
    @capacity = options('limit').to_i
  end

  def customer()
    sql = "SELECT * FROM customers INNER JOIN
     tickets ON customers.id = tickets.customer_id WHERE film_id = $1"
     values = [@id]
     customers = SqlRunner.run(sql, values)
     customers.map{|customer| Customer.new(customer)}
   end

end
