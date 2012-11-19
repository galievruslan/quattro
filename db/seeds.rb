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
@hatchback = Body.find_by_name('Hatchback')
@sedan = Body.find_by_name('Sedan')
@corolla = Model.find_by_name('Corolla')
@ceed = Model.find_by_name('Ceed')
vahicles = Vehicle.create(
	[{:model => @corolla, :body => @sedan, :year => 2005},
	{:model => @ceed, :body => @hatchback, :year => 2008}])

@toyota_corolla_sedan = Vehicle.find_by_model_id_and_body_id_and_year(@corolla.id, @sedan.id, 2005)
@kia_ceed_hatchback = Vehicle.find_by_model_id_and_body_id_and_year(@ceed.id, @hatchback.id, 2008)

@first_project = Project.new({description: 'First project'})
@first_project.vehicles << @toyota_corolla_sedan
@first_project.save()
