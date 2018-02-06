require('pg')

class Bounty

  attr_accessor :name, :species, :bounty_value, :homeworld
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value']
    @homeworld = options['homeworld']
    @id = options['id'].to_i if options['id']
  end


  

end
