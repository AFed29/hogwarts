require_relative('../models/student.rb')
require_relative('../models/house.rb')

house1 = House.new({
  "name" => "Gryffindor",
  "logo_url" => "./public/gryffindor_crest.jpg"
  })

house2 = House.new({
  "name" => "Hufflepuff",
  "logo_url" => "./public/hufflepuff_crest.jpg"
  })

house3 = House.new({
  "name" => "Ravenclaw",
  "logo_url" => "./public/ravenclaw_crest.jpg"
  })

house4 = House.new({
  "name" => "Slytherin",
  "logo_url" => "./public/slytherin_crest.jpg"
  })

  house1.save()
  house2.save()
  house3.save()
  house4.save()

  Student.delete_all()

  student1 = Student.new({
    "first_name" => "Harry",
    "last_name" => "Potter",
    "house_id" => house1.id,
    "age" => 15
  })

  student2 = Student.new({
    "first_name" => "Draco",
    "last_name" => "Malfoy",
    "house_id" => house4.id,
    "age" => 15
  })

  student3 = Student.new({
    "first_name" => "Cedric",
    "last_name" => "Diggory",
    "house_id" => house2.id,
    "age" => 17
  })

  student1.save()
  student2.save()
  student3.save()
