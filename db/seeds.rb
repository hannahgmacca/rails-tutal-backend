# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subject.create(label: 'Maths')
Subject.create(label: 'Science')
Subject.create(label: 'English')
Subject.create(label: 'PE')
Subject.create(label: 'Chemistry')
Subject.create(label: 'Biology')

User.create(email: "dan@ymail.com", password: "pword", password_confirmation: "pword")
User.create(email: "han@ymail.com", password: "pword", password_confirmation: "pword")
User.create(email: "admin@ymail.com", password: "pword", password_confirmation: "pword")
User.create(email: "student@ymail.com", password: "pword", password_confirmation: "pword")
User.create(email: "student2@ymail.com", password: "pword", password_confirmation: "pword")


UserInfo.create(first_name: "Danny", last_name: "Jones", about: "Tutor", postcode: 2000, user_id: 1)
UserInfo.create(first_name: "Hannah", last_name: "McDonald", about: "Tutor", postcode: 2005, user_id: 2)
UserInfo.create(first_name: "Admin", last_name: "User", about: "Practice admin - need to add admin to user table", postcode: 3000, user_id: 3)
UserInfo.create(first_name: "Grace", last_name: "Singh", about: "Practice student", postcode: 3000, user_id: 4)
UserInfo.create(first_name: "Rose", last_name: "Fig", about: "Practice student", postcode: 3001, user_id: 5)

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

Request.create(student_id: 1, tutor_id: 1, is_approved: false)
Request.create(student_id: 1, tutor_id: 2, is_approved: false)
Request.create(student_id: 2, tutor_id: 1, is_approved: true)
Request.create(student_id: 2, tutor_id: 2, is_approved: false)

TutorStudent.create(student_id: 1, tutor_id: 1, review: 5)
TutorStudent.create(student_id: 2, tutor_id: 1, review: 4)


