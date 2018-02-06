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

  def Bounty.all()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "SELECT * FROM bounty_details"
    db.prepare("all", sql)
    bounty_details = db.exec_prepared("all")
    db.close()

    return bounty_details.map{|bounty| Bounty.new(bounty)}
  end

  def delete()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "DELETE FROM bounty_details WHERE id=$1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end

  def update()
      db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
      sql = "UPDATE bounty_details SET (name, species, bounty_value, homeworld) = ($1, $2, $3, $4) WHERE id=$5"
      values = [@name, @species, @bounty_value, @homeworld, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
  end


end
