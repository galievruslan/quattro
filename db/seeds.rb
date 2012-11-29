# encoding: UTF-8
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

@first_project = Project.new({description: 'First project', finish_date: '2012-11-22', name:'Первый проект', rating:0})
@first_project.vehicles << @vw_jetta_sedan
@first_project.save()

@second_project = Project.new({description: 'Second project', finish_date: '2012-05-10', name:'Второй проект', rating:0})
@second_project.vehicles << @bmw_i320_sedan
@second_project.save()

@firth_project = Project.new({description: 'Firth project', finish_date: '2011-07-13', name:'Третий проект', rating:0})
@firth_project.vehicles << @audi_q7_universal
@firth_project.save()

@fourth_project = Project.new({description: 'Fourth project', finish_date: '2010-03-08', name:'Четвертый проект', rating:0})
@fourth_project.vehicles << @infinity_rx350_universal
@fourth_project.save()

@company = Company.create(description: 'Лаборатория автомобильной эстетики Quattro, мы делаем ваши автомобили произведением исскуства')

emails= Email.create([{value: 'galievruslan@gmail.com'},{value: 'golfarid@gmail.com'},{value: 'yan.tsetsko@gmail.com'}])
phones=Phone.create([{value: '8(925)482-36-14'},{value: '8(728)422-33-14'},{value: '8(995)082-46-16'}])
addresses=Address.create([{value: 'г.Казань, ул. Восстания,131'},{value: 'г.Казань, ул. Техническая,21'},{value: 'г.Казань, ул. Московская,24'}])

@company.contacts << emails
@company.contacts << phones
@company.contacts << addresses

@service1=Service.create({name: 'обклейка', description: 'обклейка машин пленкой'})
@service2=Service.create({name: 'тонировка', description: 'тонировка стекол автомобиля пленкой'})
@service3=Service.create({name: 'карбон 3D', description: 'обклейка машин пленкой карбон 3D'})
@service4=Service.create({name: 'бронирование', description: 'бронирование машин от сколов'})
@first_project.services << [@service1,@service2]
@second_project.services << @service2
@firth_project.services << [@service3,@service4]
@fourth_project.services << @service4

first_project_photos=ProjectPhoto.create({default: true,image_name: "Getz_1.jpg", image_uid: "2012/11/23/13_50_07_759_Getz_1.jpg"})
second_project_photos=ProjectPhoto.create([{default: true, image_name: "Kalina_green_1.jpg", image_uid: "2012/11/23/13_50_18_507_Kalina_green_1.jpg"},{default: false, image_name: "Kalina_green_2.jpg", image_uid: "2012/11/23/13_50_34_804_Kalina_green_2.jpg"},{default: false, image_name: "Kalina_green_3.jpg", image_uid: "2012/11/23/13_51_23_370_Kalina_green_3.jpg"}])
firth_project_photos=ProjectPhoto.create([{default: true, image_name: "Niva_1.jpg", image_uid: "2012/11/23/13_51_36_310_Niva_1.jpg"},{default: false, image_name: "Niva_2.jpg", image_uid: "2012/11/23/13_51_53_869_Niva_2.jpg"},
{default: false, image_name: "Niva_3.jpg", image_uid: "2012/11/23/13_52_07_657_Niva_3.jpg"},{default: false, image_name: "Niva_4.jpg", image_uid: "2012/11/23/13_52_22_621_Niva_4.jpg"},{default: false, image_name: "Niva_5.jpg", image_uid: "2012/11/23/13_52_34_93_Niva_5.jpg"}])
fourth_project_photos=ProjectPhoto.create([{default: true, image_name: "Sylphy_1.jpg", image_uid: "2012/11/23/13_52_58_537_Sylphy_1.jpg",project_id: @fourth_project.id},{default: false, image_name: "Sylphy_2.jpg", image_uid: "2012/11/23/13_53_09_845_Sylphy_2.jpg"},
{default: false, image_name: "Sylphy_3.jpg", image_uid: "2012/11/23/13_53_24_18_Sylphy_3.jpg"}])
@first_project.project_photos << first_project_photos
@second_project.project_photos << second_project_photos
@firth_project.project_photos << firth_project_photos
@fourth_project.project_photos << fourth_project_photos
@customer = Customer.create({:name => "customer 1"})
@action_registration = ActionRegistration.create({:customer => @customer, :vehicle => @vw_jetta_sedan})