# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Question.destroy_all
Answer.destroy_all
TestPassage.destroy_all
Category.destroy_all
Badge.destroy_all
User.destroy_all

User.create([{ first_name: 'David', last_name: 'Brown', type: 'Admin',
               email: 'david@mail', password: 123456 },
             { first_name: 'Mikhail', last_name: 'Viktor',
               email: 'mikhail@mail', password: 123456 }])
Category.create([{ title: 'Game Development' }, { title: 'Web Development' }])
Test.create([{title: 'Ruby', level: 3, category: Category.last, author: Admin.last},
             {title: 'C#', level: 5, category: Category.first, author: Admin.last}])
Question.create([{ title: 'Question1', test: Test.first }, { title: 'Question2', test: Test.first },
                 {title: 'Question3', test: Test.first }, { title: 'Question4', test: Test.first },
                 { title: 'Question1', test: Test.last }, { title: 'Question2', test: Test.last },
                  {title: 'Question3', test: Test.last }, { title: 'Question4', test: Test.last }])
Answer.create([{ title: 'Answer1', correct: true, question: Question.first },
               { title: 'Answer2', correct: false, question: Question.first },
               { title: 'Answer3', correct: false, question: Question.first },
               { title: 'Answer1', correct: false, question: Question.second },
               { title: 'Answer2', correct: false, question: Question.second },
               { title: 'Answer3', correct: true, question: Question.second },
               { title: 'Answer1', correct: false, question: Question.third },
               { title: 'Answer2', correct: true, question: Question.third },
               { title: 'Answer3', correct: false, question: Question.third },
               { title: 'Answer1', correct: false, question: Question.fourth },
               { title: 'Answer2', correct: false, question: Question.fourth },
               { title: 'Answer3', correct: true, question: Question.fourth }])

Badge.create([{ name: 'Game Dev Master',
                file: 'https://i.kym-cdn.com/photos/images/facebook/001/145/713/98e.png',
                reason: 'Выдается после прохождения всех тестов в категории Game Dev'},
              { name: 'Web Master',
                file: 'https://www.meme-arsenal.com/memes/1cf28cfb2d1100e83dd7f35c31754b79.jpg',
                reason: 'Выдается после прохождения всех тестов в категории Ruby'},
              { name: 'First Try',
                file: 'https://static.wikia.nocookie.net/fortnite_gamepedia/images/5/51/New_Fishstick.png/revision/latest?cb=20200602221351',
                reason: 'Выдается после прохождения любого из тестов с первой попытки'},
              { name: 'Test Guru Master',
                file: 'https://strausz.web.elte.hu/140404/Insidious_Smile.jpg',
                reason: 'Выдается после прохождения всех тестов'}])
