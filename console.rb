require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')
require_relative('models/screening.rb')

require( 'pry-byebug' )

Screening.delete_all
Customer.delete_all
Film.delete_all
Ticket.delete_all

customer1 = Customer.new({ "name" => "Chuck Norris", "funds" => "5000"})
customer1.save

customer2 = Customer.new({ "name" => "Ben Florist", "funds" => "1000"})
customer2.save

customer3 = Customer.new({ "name" => "Hillary Dorris", "funds" => "3000"})
customer3.save

customer4 = Customer.new({ "name" => "Mikey McMcis", "funds" => "2000"})
customer4.save


film1 = Film.new({ "title" => "Way of the Dragon", "price" => "10"})
film1.save


screening1 = Screening.new({ "screentime" => "2000"})
screening1.save
#
screening2 = Screening.new({ "screentime" => "1920"})
screening2.save


ticket1 = Ticket.new({ "customer_id" => customer1.id, "film_id" => film1.id, "screen_id" => screening2.id})
ticket1.save

ticket2 = Ticket.new({ "customer_id" => customer2.id, "film_id" => film1.id, 'screen_id' => screening1.id })
ticket2.save

ticket3 = Ticket.new({ "customer_id" => customer3.id, "film_id" => film1.id, 'screen_id' => screening1.id })
ticket3.save

ticket4 = Ticket.new({ "customer_id" => customer4.id, "film_id" => film1.id, 'screen_id' => screening1.id })
ticket4.save


# customer2.name = "Tim Nevis"
# customer2.update
#
# film1.title = "Day in a Wagon"
# film1.update

# ticket1.customer_id = customer1.id
# ticket1.update
#if customer1.id = ticket.customer_id
# customer1.film
# film1.customer
#
# customer1.remove_price

film1.screening
film1.most_popular_time

Screening.all
Customer.all
Film.all
Ticket.all

binding.pry
nil
