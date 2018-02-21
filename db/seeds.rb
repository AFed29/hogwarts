require_relative('../models/student.rb')

Student.delete_all()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Griffindor",
  "age" => 15
})

student2 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house" => "Slytherin",
  "age" => 15
})

student3 = Student.new({
  "first_name" => "Cedric",
  "last_name" => "Diggory",
  "house" => "Hufflepuff",
  "age" => 17
})

student1.save()
student2.save()
student3.save()
