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
categories = Category.create([{ title: 'Game Development' }, { title: 'Web Development' }])
tests = Test.create([{title: 'Ruby', level: 3, category: categories[1], author: Admin.last},
             {title: 'C#', level: 5, category: categories[0], author: Admin.last}])
questions = Question.create([{ title: 'Кто создал Ruby?', test: tests[0] }, { title: 'Первое появление Ruby?', test: tests[0] },
                 {title: 'Как называется массив?', test: tests[0] }, { title: 'К какому классу относится число 8?', test: tests[0] },
                 { title: 'Кто создал C#?', test: tests[1] }, { title: 'Год создания C#', test: tests[1] },
                  {title: 'На каком движке была создана игра Metal Gear Solid?', test: tests[1] }, { title: 'Как называется структура?', test: tests[1] }])
Answer.create([{ title: 'Yukihiro "Matz" Matsumoto', correct: true, question: questions[0] },
               { title: 'Guido van Rossum', correct: false, question: questions[0] },
               { title: 'Brendan Eich', correct: false, question: questions[0] },
               { title: '1990', correct: false, question: questions[1] },
               { title: '1999', correct: false, question: questions[1] },
               { title: '1995', correct: true, question: questions[1] },
               { title: 'List', correct: false, question: questions[2] },
               { title: 'Array', correct: true, question: questions[2] },
               { title: 'Group', correct: false, question: questions[2] },
               { title: 'String', correct: false, question: questions[3] },
               { title: 'Fixnum', correct: false, question: questions[3] },
               { title: 'Integer', correct: true, question: questions[3] },
               { title: 'Rasmus Lerdorf', correct: false, question: questions[4] },
               { title: 'Anders Hejlsberg', correct: true, question: questions[4] },
               { title: 'Chris Lattner', correct: false, question: questions[4] },
               { title: '1997', correct: false, question: questions[5] },
               { title: '1994', correct: false, question: questions[5] },
               { title: '2001', correct: true, question: questions[5] },
               { title: 'Fox Engine', correct: true, question: questions[6] },
               { title: 'Unreal Engine', correct: false, question: questions[6] },
               { title: 'RE Engine', correct: false, question: questions[6] },
               { title: 'Class', correct: false, question: questions[7] },
               { title: 'Struct', correct: true, question: questions[7] },
               { title: 'Model', correct: false, question: questions[7] }])

Badge.create([{ name: 'game',
                file: 'https://i.kym-cdn.com/photos/images/facebook/001/145/713/98e.png',
                reason: 'Выдается после прохождения всех тестов в категории Game',
                rule_type: :category, rule_value: 'Game Development'},
              { name: 'web',
                file: 'https://www.meme-arsenal.com/memes/1cf28cfb2d1100e83dd7f35c31754b79.jpg',
                reason: 'Выдается после прохождения всех тестов в категории Web',
                rule_type: :category, rule_value: 'Web Development'},
              { name: 'first_try',
                file: 'https://fortnaite.ru/wp-content/uploads/2021/12/Fishstickico.png',
                reason: 'Выдается после прохождения любого из тестов с первой попытки',
                rule_type: :first_try, rule_value: 1},
              { name: 'level',
                file: 'https://strausz.web.elte.hu/140404/Insidious_Smile.jpg',
                reason: 'Выдается после прохождения всех тестов определенного уровня',
                rule_type: :level, rule_value: 4 }])
