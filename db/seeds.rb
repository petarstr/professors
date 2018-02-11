require 'faker'

# Beograd
city = City.find_or_create_by!(name: 'Beograd')
faculty = Faculty.find_or_create_by!(name: 'Fakulter Organizacionih Nauka', city_id: city.id)
course = Course.find_or_create_by(title: 'Informacioni Sistemi i Tehnologije', faculty_id: faculty.id)
Subject.find_or_create_by!(title: 'Matematika 1', year: 1, course_id: course.id)

# Novi Sad
city_1 = City.find_or_create_by!(name: 'Novi Sad')
faculty_1 = Faculty.find_or_create_by!(name: 'Fakulter Tehnickih Nauka', city_id: city_1.id)
course_1 = Course.find_or_create_by(title: 'Mehatronika', faculty_id: faculty_1.id)
Subject.find_or_create_by!(title: 'Matematika 1', year: 1, course_id: course_1.id)

User.create!(
  uid: 'test_user@gmail.com',
  password: 'testpassword',
  email: 'test_user@gmail.com'
)

Professor.create!(
  uid: 'test_prof@gmail.com',
  password: 'testpassword',
  email: 'test_prof@gmail.com',
  username: Faker::Internet.user_name,
  first_name: Faker::Name.name,
  last_name: Faker::Name.last_name,
  mobile_phone: Faker::PhoneNumber.cell_phone,
  phone: Faker::PhoneNumber.phone_number,
  city_id: city.id,
  faculty_id: faculty.id,
  facebook: Faker::Internet.domain_name,
  street_name: Faker::Address.street_name,
  street_number: Faker::Address.building_number,
  floor: Faker::Address.building_number,
  apartment_number: Faker::Address.building_number
)
