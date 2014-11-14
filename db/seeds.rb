# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 admin = User.create(
    :email => "admin@gmail.com",
    :password => "12345678",
    :password_confirmation => "12345678",
    :first_name => "admin",
    :last_name => "admin",
    :admin => true
)
 dealer = User.create(
    :email => "dealer@gmail.com",
    :password => "12345678",
    :password_confirmation => "12345678",
    :first_name => "dealer",
    :last_name => "dealer",
    :dealer => "dealer"
)