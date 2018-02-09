require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require ('pry_byebug')

customer1 = ({ "name" => "Chuck Norris", "funds" => "5000"})

film1 = ({ "title" => "Way of the Dragon", "price" => "10"})

ticket1 = ({"customer_id" => customer1.id, "film_id" => film1.id})
