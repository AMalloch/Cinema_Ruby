require_relative('../db/sql_runner.rb')

class Ticket

 attr_reader :id
 attr_accessor :customer_id, :film_id

 def initialize(options)
   @customer_i = options('customer_id').to_i
   @film_id = options('film_id').to_i
 end


end