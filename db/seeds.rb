# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  uid: 'test_user@gmail.com',
  password: 'testpassword',
  email: 'test_user@gmail.com'
)

Professor.create!(
  uid: 'test_prof@gmail.com',
  password: 'testpassword',
  email: 'test_prof@gmail.com'
)

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
