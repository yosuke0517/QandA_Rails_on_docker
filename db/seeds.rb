# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do |number|
  Question.create(id:"#{number+1}", name: 'Test name' + "#{number+1}",title: 'Test title'  + "#{number+1}",
                  content: 'Test content'  + "#{number+1}",user_id: 4,author: 'sample')
end


