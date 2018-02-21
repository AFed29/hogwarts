require_relative('../db/sql_runner.rb')

class House
  attr_reader :id, :name, :logo_url

    def initialize( options )
      @id = options['id'].to_i if options['id']
      @name = options['name']
      @logo_url = options['logo_url']
    end

    def save()
      sql = "INSERT INTO houses
            (
              name,
              logo_url
            )
            VALUES
            (
              $1, $2
            )
            RETURNING *;"
      values = [@name, @logo_url]
      house = SqlRunner.run( sql, values )
      @id = house.first()['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM houses;"
      houses = SqlRunner.run( sql )
      return houses.map { |house| House.new(house) }
    end

    def self.find_by_id(id)
      sql = "SELECT * FROM houses
            WHERE id = $1"
      values = [id]
      house = SqlRunner.run( sql, values ).first()
      return House.new( house )
    end
    
end
