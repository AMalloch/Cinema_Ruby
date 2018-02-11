require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2)
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map{|film| Film.new(film)}
  end

  def update()
    sql = "UPDATE films SET title = $1, price = $2 WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def customer()
    sql = "SELECT * FROM customers INNER JOIN
    tickets ON customers.id = tickets.customer_id WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    customers.map{|customer| Customer.new(customer)}
  end

  def screening()
    sql = "SELECT * FROM screenings INNER JOIN
    tickets ON screenings.id = tickets.screen_id WHERE film_id = $1"
    values = [@id]
    screenings = SqlRunner.run(sql, values)
    screenings.map {|screening|Screening.new(screening)}
  end

  def most_popular_time
    screening.
  end

    # time = screening.each do |id, screentime|
    # end
    #   time.max_by
    # popular_time = screening
    # popular_time.group_by(&:itself).max_by(&:size).first
    # screening.map{|time| screening.count(time)}
    # screening.group_by(&:itself).values.max_by(&:size).first
    # screening.uniq.map {|time| screening.count(time)}.max

  def customers_watching()
    customer.count
  end

end
