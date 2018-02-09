require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @title = options('title')
    @price = options('price').to_i
  end

end
