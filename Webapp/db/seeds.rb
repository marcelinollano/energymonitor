# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sap.create(bill: '0.0', price: '0.0')

Thing.create(name: 'Desk Lamp', time: '0', watts: '100')
Thing.create(name: 'CRT Monitor', time: '0', watts: '340')
Thing.create(name: 'Refrigerator', time: '0', watts: '700')
Thing.create(name: 'Air Conditioner', time: '0', watts: '3500')
Thing.create(name: 'Dishwasher', time: '0', watts: '3600')
Thing.create(name: 'Clothes Dryer', time: '0', watts: '4400')