require_relative('../db/sql_runner.rb')

class Ticket

 attr_reader :id
 attr_accessor :customer_id, :film_id

 def initialize(options)
   @id = options['id'].to_i if options['id'].to_i
   @customer_id = options['customer_id'].to_i
   @film_id = options['film_id'].to_i
   @screen_id = options['screen_id'].to_i
 end

 def save()
   sql = "INSERT INTO tickets (customer_id, film_id, screen_id) VALUES ($1, $2, $3)
   RETURNING id"
   values = [@customer_id, @film_id, @screen_id]
   ticket = SqlRunner.run(sql, values).first
   @id = ticket['id'].to_i
 end

 def self.delete_all()
   sql = "DELETE FROM tickets"
   SqlRunner.run(sql)
 end

 def self.all()
   sql = "SELECT * FROM tickets"
   tickets = SqlRunner.run(sql)
   return tickets.map{|ticket| Ticket.new(ticket)}
 end

 def update()
   sql = "UPDATE tickets SET customer_id = $1, film_id = $2, screen_id = $3 WHERE id = $4"
   values = [@customer_id, @film_id, @screen_id, @id]
   SqlRunner.run(sql, values)
 end

end
