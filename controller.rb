require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( './models/student.rb' )
require_relative( './models/house.rb')

get '/students' do
  @students = Student.all()
  erb( :index )
end

post '/students' do
  @student = Student.new( params )
  @student.save()
  erb( :create )
end

get '/students/new' do
  @houses = House.all()
  erb( :new )
end
