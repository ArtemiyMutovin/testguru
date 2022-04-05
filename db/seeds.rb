# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([{ email: 'david@mail' }, { email: 'mike@mail' }])
Category.create([{ title: 'Web Development' }, { title: 'Game Development' }])
Test.create([{ title: 'Ruby', level: 3, category: Category.last, author: User.last }])
Question.create([{ title: 'Question1', test: Test.first }])
Answer.create([{ title: 'Answer1', correct: '1', question: Question.first }])

