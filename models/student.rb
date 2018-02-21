require_relative( '../db/sql_runner.rb' )
require_relative( './house.rb' )

class Student

  attr_reader :id, :first_name, :last_name, :house_id, :age

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students
          (
            first_name,
            last_name,
            house_id,
            age
          )
          VALUES
          (
            $1, $2, $3, $4
          )
          RETURNING *;"
    values = [@first_name, @last_name, @house_id, @age]
    student = SqlRunner.run( sql, values )
    @id = student.first()['id'].to_i
  end

  def full_name()
    return "#{first_name} #{last_name}"
  end

  def house()
    sql = "SELECT * FROM houses
          WHERE id = $1;"
    values = [@house_id]
    house = SqlRunner.run( sql, values ).first()
    return House.new( house )
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run(sql)
    result = students.map { |student| Student.new(student) }
  end

  def self.find_by_id( id )
    sql = "SELECT * FROM students
          WHERE id = $1;"
    values = [id]
    student = SqlRunner.run( sql, values ).first()
    return Student.new( student )
  end

end
