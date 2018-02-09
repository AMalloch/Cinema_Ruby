require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require( 'pry-byebug' )

Customer.delete_all
Film.delete_all
Ticket.delete_all

customer1 = Customer.new({ "name" => "Chuck Norris", "funds" => "5000"})
customer1.save

customer2 = Customer.new({ "name" => "Ben Florist", "funds" => "1000"})
customer2.save

film1 = Film.new({ "title" => "Way of the Dragon", "price" => "10"})
film1.save

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
ticket1.save

binding.pry
nil
