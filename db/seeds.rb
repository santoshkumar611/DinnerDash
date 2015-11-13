# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create(display_name: "user",email: "km@gmail.com",password: "password",password_confirmation: "password",full_name: "user",is_admin: false)

User.create(display_name: "admin",email: "kmvnvv@gmail.com",password: "password",password_confirmation: "password",full_name: "admin",is_admin: true)