require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :screentime

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @screentime = options['screentime'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (screentime) VALUES ($1)
    RETURNING id"
    values = [@screentime]
    screening = SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run(sql)
    return screenings.map{|screening| Screening.new(screening)}
  end

end
