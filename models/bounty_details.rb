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

  def save()
    db = PG.connect({dbname: 'space_cowboys',host: 'localhost'})

    sql = "INSERT INTO bounty_details (
    name, species, bounty_value, homeworld
    ) VALUES (
      $1, $2, $3, $4
      ) RETURNING *"

      values = [@name, @species, @bounty_value, @homeworld]

      db.prepare("save", sql)

      @id = db.exec_prepared("save", values)[0]["id"].to_i

      db.close()
  end

  def delete()
    db = PG.connect({dbname: 'space_cowboys',host: 'localhost'})
    sql = "DELETE FROM bounty_details WHERE id=$1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end


end
