# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Note.delete_all

user1 = User.create({name:'guihehans', password: 'password'})
user2 = User.create({name:'notguihe', password: '123456'})

Note.create(user:user1, title: 'my first note')
Note.create(user:user1, title: 'my 2nd note')
Note.create(user:user2, title: 'ahh, my first note')
Note.create(user:user2, title: 'ohh, my 2nd note')