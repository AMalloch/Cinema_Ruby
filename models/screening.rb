require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :screentime

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @screentime = options('screentime').to_i
  end

end
