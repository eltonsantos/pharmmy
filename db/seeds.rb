# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: ENV["ADMIN_EMAIL"], password: ENV["ADMIN_PASSWORD"], password_confirmation: ENV["ADMIN_PASSWORD"], role: ENV["ADMIN_ROLE"])
User.create(name: "Elton Santos", email: "elton@elton.com", password: 123456, password_confirmation: 123456, role: 0)
User.create(name: "Ericson Santos", email: "eric@eric.com", password: 123456, password_confirmation: 123456, role: 0)
User.create(name: "Administrador", email: "admin@admin.com", password: 123456, password_confirmation: 123456, role: 1)

Category.create(name: "Dor de cabeça", user_id: 1)
Category.create(name: "Dor de barriga", user_id: 1)
Category.create(name: "Febre", user_id: 1)