# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brands = Brand.create([{name: 'Toyota'}, {name: 'KIA'}, {name: 'Chevrolet'}, {name: 'Volkswagen'}, {name: 'Infinity'}, {name: 'BMW'}, {name: 'Audi'}])
@toyota = Brand.find_by_name('Toyota')
@toyota.models.create([{:name => 'Camry'}, {:name => 'Corolla'}])
@kia = Brand.find_by_name('KIA')
@kia.models.create({:name => 'Ceed'})
bodies = Body.create([{name: 'Hatchback'}, {name: 'Sedan'}, {name: 'Universal'}])
@hatchback = Body.find_by_name('Hatchback')
@sedan = Body.find_by_name('Sedan')
@universal = Body.find_by_name('Universal')
@corolla = Model.find_by_name('Corolla')
@ceed = Model.find_by_name('Ceed')

@vw = Brand.find_by_name('Volkswagen')
@vw.models.create({:name => 'Jetta'})
@jetta = Model.find_by_name('Jetta')
@bmw = Brand.find_by_name('BMW')
@bmw.models.create({:name => 'i320'})
@i320 = Model.find_by_name('i320')
@infinity = Brand.find_by_name('Infinity')
@infinity.models.create({:name => 'RX350'})
@rx350 = Model.find_by_name('RX350')
@audi = Brand.find_by_name('Audi')
@audi.models.create({:name => 'Q7'})
@q7 = Model.find_by_name('Q7')

vahicles = Vehicle.create(
	[{:model => @corolla, :body => @sedan, :year => 2005},
	{:model => @ceed, :body => @hatchback, :year => 2008},
	{:model => @jetta, :body => @sedan, :year => 2008},
	{:model => @i320, :body => @sedan, :year => 2010},
	{:model => @q7, :body => @universal, :year => 2011},
	{:model => @rx350, :body => @universal, :year => 2009}])

@toyota_corolla_sedan = Vehicle.find_by_model_id_and_body_id_and_year(@corolla.id, @sedan.id, 2005)
@kia_ceed_hatchback = Vehicle.find_by_model_id_and_body_id_and_year(@ceed.id, @hatchback.id, 2008)
@vw_jetta_sedan = Vehicle.find_by_model_id_and_body_id_and_year(@jetta.id, @sedan.id, 2008)
@bmw_i320_sedan = Vehicle.find_by_model_id_and_body_id_and_year(@i320.id, @sedan.id, 2010)
@audi_q7_universal = Vehicle.find_by_model_id_and_body_id_and_year(@q7.id, @universal.id, 2011)
@infinity_rx350_universal = Vehicle.find_by_model_id_and_body_id_and_year(@rx350.id, @universal.id, 2009)

@first_project = Project.new({description: 'First project'})
@first_project.vehicles << @vw_jetta_sedan
@first_project.project_image_uid = '2012/11/21/22_58_46_813_jetta.jpg'
@first_project.project_image_name = 'jetta.jpg'
@first_project.save()

@second_project = Project.new({description: 'Second project'})
@second_project.vehicles << @bmw_i320_sedan
@second_project.project_image_uid = '2012/11/21/22_59_00_502_bmw3.jpeg'
@second_project.project_image_name = 'bmw3.jpg'
@second_project.save()

@firth_project = Project.new({description: 'Firth project'})
@firth_project.vehicles << @audi_q7_universal
@firth_project.project_image_uid = '2012/11/21/22_59_19_343_q7.jpg'
@firth_project.project_image_name = 'q7.jpg'
@firth_project.save()

@fourth_project = Project.new({description: 'Fourth project'})
@fourth_project.vehicles << @infinity_rx350_universal
@fourth_project.project_image_uid = '2012/11/21/22_59_45_437_infinity.jpg'
@fourth_project.project_image_name = 'infinity.jpg'
@fourth_project.save()