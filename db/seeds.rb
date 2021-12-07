# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subject.create(title: 'Maths')
Subject.create(title: 'Science')
Subject.create(title: 'English')
Subject.create(title: 'PE')
Subject.create(title: 'Chemistry')
Subject.create(title: 'Biology')

User.create(username: "Danny", email: "dan@ymail.com", password: "enemona", password_confirmation: "enemona")
User.create(username: "Hannah", email: "han@ymail.com", password: "pword", password_confirmation: "pword")
User.create(username: "Admin", email: "admin@ymail.com", password: "pword", password_confirmation: "pword")
User.create(username: "Student", email: "student@ymail.com", password: "pword", password_confirmation: "pword")
User.create(username: "Student2", email: "student2@ymail.com", password: "pword", password_confirmation: "pword")


UserInfo.create(first_name: "Danny", last_name: "Jones", about: "Tutor", suburb: "Brookfarm", user_id: 1)
UserInfo.create(first_name: "Hannah", last_name: "McDonald", about: "Tutor", suburb: "Burleigh", user_id: 2)
UserInfo.create(first_name: "Admin", last_name: "User", about: "Practice admin - need to add admin to user table", suburb: "Brisbane", user_id: 3)
UserInfo.create(first_name: "Grace", last_name: "Singh", about: "Practice student", suburb: "Alstonville", user_id: 4)
UserInfo.create(first_name: "Rose", last_name: "Fig", about: "Practice student", suburb: "Halbert", user_id: 5)

Student.create(user_info_id: 4)
Student.create(user_info_id: 5)
StudentSubject.create(student_id: 1, subject_id: 1)
StudentSubject.create(student_id: 1, subject_id: 2)
StudentSubject.create(student_id: 1, subject_id: 3)
StudentSubject.create(student_id: 2, subject_id: 1)
StudentSubject.create(student_id: 2, subject_id: 2)
StudentSubject.create(student_id: 2, subject_id: 3)

Tutor.create(user_info_id: 1, rating: 4, rate: 20)
Tutor.create(user_info_id: 2, rating: 4, rate: 20)
TutorSubject.create(tutor_id: 1, subject_id: 1)
TutorSubject.create(tutor_id: 1, subject_id: 2)
TutorSubject.create(tutor_id: 1, subject_id: 3)
TutorSubject.create(tutor_id: 2, subject_id: 1)
TutorSubject.create(tutor_id: 2, subject_id: 2)
TutorSubject.create(tutor_id: 2, subject_id: 3)

Tutor.create(user_info_id: 1, rating: 4, rate: 20)
Tutor.create(user_info_id: 2, rating: 4, rate: 20)

Request.create(student_id: 4, tutor_id: 1, is_approved: false)
Request.create(student_id: 4, tutor_id: 2, is_approved: false)
Request.create(student_id: 5, tutor_id: 1, is_approved: true)
Request.create(student_id: 5, tutor_id: 2, is_approved: false)

