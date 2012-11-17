# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brands = Brand.create([{name: 'Toyota'}, {name: 'KIA'}, {name: 'Chevrolet'}, {name: 'Volkswagen'}])
@toyota = Brand.find_by_name('Toyota')
@toyota.models.create([{:name => 'Camry'}, {:name => 'Corolla'}])
@kia = Brand.find_by_name('KIA')
@kia.models.create({:name => 'Ceed'})
bodies = Body.create([{name: 'Hatchback'}, {name: 'Sedan'}])