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