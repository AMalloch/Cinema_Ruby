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

customer2.name = "Tim Nevis"
customer2.update

film1.title = "Bay in a Wagon"
film1.update

ticket1.customer_id = customer1.id
ticket1.update

customer1.film
film1.customer

Customer.all
Film.all
Ticket.all

binding.pry
nil
