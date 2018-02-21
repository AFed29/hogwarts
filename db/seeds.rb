require_relative('../models/student.rb')
require_relative('../models/house.rb')

Student.delete_all()
House.delete_all()

house1 = House.new({
  "name" => "Gryffindor",
  "logo_url" => "gryffindor_crest.png"
  })

house2 = House.new({
  "name" => "Hufflepuff",
  "logo_url" => "hufflepuff_crest.png"
  })

house3 = House.new({
  "name" => "Ravenclaw",
  "logo_url" => "ravenclaw_crest.png"
  })

house4 = House.new({
  "name" => "Slytherin",
  "logo_url" => "slytherin_crest.png"
  })

  house1.save()
  house2.save()
  house3.save()
  house4.save()



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

  student4 = Student.new({
    "first_name" => "Cho",
    "last_name" => "Chang",
    "house_id" => house3.id,
    "age" => 15
    })

  student1.save()
  student2.save()
  student3.save()
  student4.save()
